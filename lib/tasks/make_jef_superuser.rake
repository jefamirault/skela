namespace :make_jef_superuser do
  task now: :environment do
    jef = User.find_by_username 'jef'
    jef.privilege_level = 1
    puts jef.save ? 'jef now has superuser privileges' : 'failed'
  end
end
