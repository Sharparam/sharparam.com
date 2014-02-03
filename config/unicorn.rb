APP_PATH = "/home/rails/apps/sharparam.com"
APP_CURRENT = "#{APP_PATH}/current"
working_directory APP_CURRENT
pid "#{APP_CURRENT}/tmp/pids/unicorn.pid"
stdout_path "#{APP_ROOT}/shared/log/unicorn.log"
stderr_path "#{APP_ROOT}/shared/log/unicorn.err.log"

listen "/tmp/unicorn.sharparamcom.sock"
worker_processes 2
timeout 30

# Force the bundler gemfile environment variable to
# reference the capistrano "current" symlink
before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(APP_CURRENT, 'Gemfile')
end
