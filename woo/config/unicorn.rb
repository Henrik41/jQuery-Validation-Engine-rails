root = "/home/bill/apps/woomatch/current"
working_directory root
pid "#{root}/tmp/pids/unicorn-woomatch.pid"
stderr_path "#{root}/log/unicorn-stderr.log"
stdout_path "#{root}/log/unicorn-stdout.log"


listen "/tmp/unicorn.woomatch.sock"
worker_processes 2
timeout 60
