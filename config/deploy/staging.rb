set :stage, :staging
set :rails_env, 'staging'
set :migration_role, 'db'
set :whenever_environment, :staging
set :branch, ENV['BRANCH'] || 'develop'

role :app, %w{ app@app1.staging.trafficnews.jp }
role :web, %w{ app@app1.staging.trafficnews.jp }
role :db,  %w{ app@app1.staging.trafficnews.jp }
# role :batch, %w{ app@app1.staging.trafficnews.jp }
# role :worker, %w{ app@app1.staging.trafficnews.jp }
