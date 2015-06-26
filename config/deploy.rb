lock '3.4.0'

set :application, "cdm"
set :repo_url, "git@bitbucket.org:dippol/cdm.git"
set :deploy_to, "/var/www/caribbeanedm.com"
set :linked_dirs, fetch(:linked_dirs, []) + %w{log tmp/pids tmp/cache tmp/sockets public/uploads public/assets public/exports}
# set :linked_files, fetch(:linked_files, []) + %w{public/index.html}
set :rbenv_type, :system
set :rbenv_ruby, "2.2.2"
set :ssh_options, { forward_agent: true }

# set :rollbar_token, 'da47f7a8ad2d45b886afb55afb0209b3'
# set :rollbar_env, Proc.new { fetch :stage }
# set :rollbar_role, Proc.new { :app }

namespace :deploy do
  task :seed do
    on primary :db do
      within current_path do
        with rails_env: fetch(:stage) do
          execute :rake, 'db:seed'
        end
      end
    end
  end

  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
