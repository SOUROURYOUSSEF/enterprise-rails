# Needed for Heroku deployment
# Change to match your CPU core count
workers 1

# Min and Max threads per worker
threads 1, 6

# Daemonize the server into the background. Highly suggest that
# this be combined with “pidfile” and “stdout_redirect”.
daemonize true

app_dir = File.expand_path("../..", __FILE__)
shared_dir = "#{app_dir}/shared"
tmp_dir = "#{app_dir}/tmp"
# Default to production
rails_env = ENV['RAILS_ENV'] || "production"
environment rails_env

# Set master PID and state locations
pidfile "#{tmp_dir}/pids/puma.pid"
state_path "#{tmp_dir}/pids/puma.state"

# Logging
stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true

# Disable request logging.
# The default is “false”.

quiet

# Bind the server to “url”. “tcp://”, “unix://” and “ssl://” are the only
# accepted protocols.
# The default is “tcp://0.0.0.0:9292”.

bind 'tcp://0.0.0.0:3000'
bind "unix:///#{tmp_dir}/sockets/puma.sock"
#bind "unix:///#{tmp_dir}/sockets/puma.sock?umask=0777"

#bind 'ssl://127.0.0.1:9292?key=path_to_key&cert=path_to_cert'
# Listens on port 7001
# The default is 9292
port 3000

on_restart do
  puts 'On restart...'
end

# Command to use to restart puma. This should be just how to
# load puma itself (ie. 'ruby -Ilib bin/puma'), not the arguments
# to puma, as those are the same as the original process.

#restart_command '/u/app/lolcat/bin/restart_puma'


activate_control_app

on_worker_boot do
  require "active_record"
  ActiveRecord::Base.connection.disconnect! rescue ActiveRecord::ConnectionNotEstablished
  ActiveRecord::Base.establish_connection(YAML.load_file("#{app_dir}/config/database.yml")[rails_env])
end
