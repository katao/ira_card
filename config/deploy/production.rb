set :stage, :production
set :rails_env, :production
set :migration_role, 'db'
set :whenever_environment, :production

role :app, %w{ app@ec2-3-112-44-43.ap-northeast-1.compute.amazonaws.com }
role :web, %w{ app@ec2-3-112-44-43.ap-northeast-1.compute.amazonaws.com }
role :db,  %w{ app@ec2-3-112-44-43.ap-northeast-1.compute.amazonaws.com }
#role :batch, %w{ app@app1.trafficnews.jp }
#role :worker, %w{ app@worker1.trafficnews.jp }
