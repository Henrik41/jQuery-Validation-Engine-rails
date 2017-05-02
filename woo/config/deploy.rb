require "bundler/capistrano"
require 'capistrano/maintenance'


server "45.79.135.198", :web, :app, :db, primary: true




set :bundle_flags, "--deployment --quiet --binstubs"
set :application, "woomatch"
set :user, "bob"
set :deploy_to, "/home/bob/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :test_log, "log/capistrano-unit-test.log"
set :scm, "git"
set :repository, "git@github.com:Henrik41/woomatch.git"
set :branch, "master"
set :copy_exclude, [".git", "spec"]


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      sudo "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "kill -s USR2 `cat #{shared_path}/pids/unicorn.pid`"
  end

  desc "Start unicorn"
  task :start, :except => { :no_release => true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D -E production"
  end

  desc "Stop unicorn"
  task :stop, :except => { :no_release => true } do
    run "kill -s QUIT `cat #{shared_path}/pids/unicorn.pid`"
  end
  


  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
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