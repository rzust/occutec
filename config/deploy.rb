# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'ocutec'
set :repo_url, 'git@github.com:rzust/ocutec.git'
set :branch, 'master'
set :stages, ["production"]
set :deploy_to, '/home/deploy/apps/ocutec'

set :pty, true
set :deploy_via, :remote_cache
set :use_sudo, false
# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app

# Default value for :scm is :git
set :scm, :git




# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(:config_files, %w(
  nginx.conf
  database-example.yml
  unicorn.rb
  unicorn_init.sh
))

# which config files should be made executable after copying
# by deploy:setup_config
set(:executable_config_files, %w(
  unicorn_init.sh
))

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(:symlinks, [
  {
    source: "nginx.conf",
    link: "/etc/nginx/sites-enabled/#{fetch(:application)}"
  },
  {
    source: "unicorn_init.sh",
    link: "/etc/init.d/unicorn_#{fetch(:application)}"
  }
])


# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  before :deploy, "deploy:check_revision"
  after 'deploy:setup_config', 'nginx:reload'
  after :deploy, "deploy:restart"

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app), in: :sequence, wait: 5 do
        sudo "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
      end
    end
  end

  desc "Check if agent forwarding is working"
  task :forwarding do
    on roles(:all) do |h|
      if test("env | grep SSH_AUTH_SOCK")
        info "Agent forwarding is up to #{h}"
      else
        error "Agent forwarding is NOT up to #{h}"
      end
    end
  end

  desc "reload the database with seed data"
  task :seed => [:set_rails_env] do
    on primary (:db) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:seed"
        end
      end
    end
  end

  # before  'deploy:setup_config', 'nginx:remove_default_vhost'
  # after   'deploy:setup_config', 'nginx:reload'
  # after   'deploy:publishing', 'deploy:restart'
  # desc 'Restart application'
  # task :restart do
  #   on roles(:app), in: :sequence, wait: 5 do
  #     # Your restart mechanism here, for example:
  #     # execute :touch, release_path.join('tmp/restart.txt')
  #   end
  # end

  # after :publishing, :restart

  # after :restart, :clear_cache do
  #   on roles(:web), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  # task :setup_config do 

  # end
  # after 'deploy:setup_config', 'nginx:reload'

end
