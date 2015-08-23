# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'skela'
set :repo_url, 'https://github.com/AdmiralJef/skela.git'
set :rbenv_ruby, '2.1.2'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/var/www/my_app_name'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
  
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # execute "service thin restart"  ## -> line you should add
      `rake db:migrate ENV=production`
    end
  end
  
  after :publishing, 'deploy:restart'

  task :setup_secrets do
    # put File.read("config/secrets.yml"), "#{shared_path}/config/secrets.yml"
    secrets = File.read("config/secrets.yml")
    `echo #{secrets} >> #{shared_path}/config/secrets.yml`
  end
  after :publishing, 'deploy:setup_secrets'
end

