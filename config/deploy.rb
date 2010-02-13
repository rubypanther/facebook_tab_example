set :application, "facebook_blog_tab"
set :repository,  "paris@rubypanther.com:/home/paris/git/facebook_blog_tab.git"
set :deploy_to, "/home/paris/sites/#{application}"
set :user, "paris"
set :use_sudo, false
set :apache_conf_dir, "/etc/httpd/conf.d"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "facebook.rubypanther.com"                          # Your HTTP server, Apache/etc
role :app, "facebook.rubypanther.com"                          # This may be the same as your `Web` server
role :db,  "facebook.rubypanther.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end

  desc "Reload the app in passenger"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  
  desc "Restart apache"
  task :restart_apache, :roles => :web do
    sudo "apachectl graceful", :pty => true
  end
  
  desc "Symlink database.yml"
  task :symlink_db, :roles => :web do
    run "ln -nfs #{deploy_to}/current/config/database.example.yml #{deploy_to}/current/config/database.yml"
  end
  
  desc "Symlink apache config"
  task :symlink_apache, :roles => :web do
    sudo "ln -sf #{deploy_to}/current/config/apache.conf #{apache_conf_dir}/#{application}.conf", :pty => true
  end
  after :symlink_apache, :restart_apache
  
end

after :deploy, :'deploy:symlink_db'
