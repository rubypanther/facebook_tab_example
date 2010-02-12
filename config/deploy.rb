set :application, "facebook_blog_tab"
set :repository,  "paris@rubypanther.com:/home/paris/git/facebook_blog_tab.git"

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
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

desc "Symlink database.yml"
task :after_symlink, :roles => :web do
  run "ln -nfs #{release_path}/config/database.example.yml #{release_path}/config/database.yml"
end
