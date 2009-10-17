set :keep_releases, 5

# server user
set :user,            "kane"
set :password,        "l0st**1397!!h@rb0r"
set :use_sudo,        false
set :port,            2002
default_run_options[:pty] = true

# application
set :application, "bookature_reader"
set :deploy_to,   "/home/apps/#{application}"

# database
set :database,        "#{application}"
set :dbuser,          user
set :dbpass,          password

# repository
set :repository,  "git@github.com:baccigalupi/bookature.git" 
set :deploy_via,  :remote_cache
set :scm,         :git
set :branch,      "master"
set :scm_verbose, true
set :scm_port,    2002

# IPs
role :app, "209.20.87.204"
role :web, "209.20.87.204"
role :db,  "209.20.87.204", :primary => true

desc "Link in shared things" 
task :after_symlink do
  # symlink log path
  run "ln -nfs #{shared_path}/log #{release_path}/log" 
  # config/database
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
end

desc "Restart Application"
deploy.task :restart, :roles => :app do
  run "touch #{current_path}/tmp/restart.txt"
end
