namespace :startup do
  desc "TODO"
  task create_superuser: :environment do
    jef = User.find_by_username 'Jef'

    if jef.nil?
      jef = User.new username: 'Jef', password: 'password1'
      if jef.save
        puts 'User Jef created.'
      end
    end

    unless jef.is_superuser?
      jef.privilege_level = 1
      puts 'Jef now has superuser privileges.' if jef.save
    else
      'Jef already has superuser privileges.'
    end
  end

end
