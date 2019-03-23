# path
app_path = '/var/www/ira_card'
app_shared_path = "#{app_path}/shared"

pid "#{app_shared_path}/tmp/pids/unicorn.pid"

# listen
listen "#{app_shared_path}/tmp/sockets/unicorn.sock", backlog: 1024, tcp_nopush: true, tcp_defer_accept: 1

# logging
stdout_path "#{app_shared_path}/log/unicorn.stdout.log"
stderr_path "#{app_shared_path}/log/unicorn.stderr.log"

# workers
worker_processes 8
timeout 120
preload_app true

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_path}/current/Gemfile";
end

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end
