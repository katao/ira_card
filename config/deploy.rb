lock "~> 3.11.0"

set :application, 'ira_card'
set :repo_url, 'git@github.com:katao/ira_card.git'

set :deploy_to, '/var/www/ira_card'
set :branch, ENV['BRANCH'] || 'master'

set :pty, false
# set :scm, :git

set :rbenv_type, :system
set :rbenv_ruby, File.read('.ruby-version').strip

append :linked_files, '.env', 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'tmp/csv', 'public/system'

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :whenever_roles, -> { :batch }

set :maintenance_template_path, File.expand_path("../../lib/templates/maintenance.html", __FILE__)
set :maintenance_roles, -> { roles([:web]) }

set :keep_releases, 5

#set :slackistrano, {
#    klass: Slackistrano::CustomMessaging,
#    channel: '#deploy',
#    webhook: 'https://hooks.slack.com/services/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'
#}

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'unicorn:restart'
    end
  end

  after :publishing, :restart
  after :restart, :clear_cache do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
      within current_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'tmp:cache:clear'
        end
      end
    end
  end
end
