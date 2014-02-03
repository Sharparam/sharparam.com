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
