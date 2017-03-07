if ENV["RAILS_ENV"] == "development"
  worker_processes 1
else
  worker_processes 3
end

timeout 30


# set path to application
app_path = File.expand_path(File.dirname(__FILE__) + '/..')
shared_dir = "/home/shop-it/staging/shared"
working_directory app_path


# Set unicorn options
worker_processes (ENV['RAILS_ENV'] == 'production' ? 4 : 1)
preload_app true
timeout 300

# Set up socket location
listen app_path + '/tmp/unicorn.sock', backlog: 64
listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'

# Logging
stderr_path app_path + '/log/unicorn.log'
stdout_path app_path + '/log/unicorn.log'

# Set master PID location
pid app_path + '/tmp/unicorn.pid'

# Garbage collection settings.
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
