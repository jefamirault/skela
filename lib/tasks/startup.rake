namespace :startup do
  desc 'Stuff only needed for startup'
  task create_superuser: :environment do
    admin = User.find_by_username 'Admin'

    if admin.nil?
      admin = User.new username: 'Admin', password: 'ChangeMe!'
      if admin.save
        puts 'User Admin created.'
      end
    end

    unless admin.is_superuser?
      admin.privilege_level = 1
      puts 'Admin now has superuser privileges.' if admin.save
    else
      'Admin already exists with superuser privileges.'
    end
  end
  task skelaplex: :environment do

    APP_DIR = '~/web/skela'
    PORT = 3000

    `tmux start-server`

    `tmux new-session -d -s skelaplex -n Server`
      `tmux send-keys -t skelaplex:0 "cd #{APP_DIR}; rails s -p #{PORT}" C-m`

      `tmux split-window -h -t skelaplex:0`
        `tmux resize-pane -R -t skelaplex:0 18`
        `tmux send-keys -t skelaplex:0 "cd #{APP_DIR}" C-m C-l`
        `tmux send-keys -t skelaplex:0 "rails c" C-m`


    `tmux new-window -t skelaplex:1 -n Bash`
    `tmux send-keys -t skelaplex:1 "cd #{APP_DIR}; git show --stat" C-m`

    `tmux select-window -t skelaplex:0`
    `tmux attach-session -t skelaplex`
  end
end
