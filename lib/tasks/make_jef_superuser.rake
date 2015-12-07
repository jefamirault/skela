namespace :make_jef_superuser do
  task now: :environment do
    jef = User.find_by_username 'jef'
    if jef.nil?
      puts 'User jef does not exist'
    else
      jef.privilege_level = 1
      puts jef.save ? 'jef now has superuser privileges' : 'failed'
    end
  end
end
