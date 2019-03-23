#require_relative 'config/environment'
#require 'unicorn/worker_killer'
#use Unicorn::WorkerKiller::MaxRequests, 3072, 4096
#use Unicorn::WorkerKiller::Oom, (300*(1024**2)), (400*(1024**2))

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
