require "bundler/capistrano"
require "rvm/capistrano"

server "sharparam.com", :web, :app, :db, primary: true

set :application, "sharparam.com"
set :user, "rails"
set :port, 2553
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, :git
set :repository,  "git@github.com:Sharparam/#{application}.git"
set :branch, "master"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :deploy do
    %w[start stop restart].each do |command|
        desc "#{command} unicorn server"
        task command, roles: :app, except: {no_release: true} do
            sudo "/etc/init.d/unicorn_#{application} #{command}"
        end
    end

    task :setup_config, roles: :app do
        sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
        run "chmod +x #{current_path}/config/unicorn_init.sh"
        sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
        run "mkdir -p #{shared_path}/config"
        put File.read("config/database.yml.example"), "#{shared_path}/config/database.yml"
        puts "Now edit the config files in #{shared_path}."
    end

    after "deploy:setup", "deploy:setup_config"

    task :symlink_config, roles: :app do
        run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    end

    after "deploy:finalize_update", "deploy:symlink_config"

    desc "Make sure local git is in sync with remote."
    task :check_revision, roles: :web do
        unless `git rev-parse HEAD` == `git rev-parse origin/master`
            puts "WARNING: HEAD is not the same as origin/master"
            puts "Run `git push` to sync changes."
            exit
        end
    end

    before "deploy", "deploy:check_revision"
end

#role :web, "sharparam.com"                   # Your HTTP server, Apache/etc
#role :app, "sharparam.com"                   # This may be the same as your `Web` server
#role :db,  "sharparam.com", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
