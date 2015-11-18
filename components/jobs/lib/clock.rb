require 'clockwork'
require 'sidekiq'

# If you need to load your entire environment for your jobs, simply add
# require './config/boot'
# require './config/environment'

# load all jobs from app/jobs directory
# no need to load rails env, we only care about classes
# (#perform method is not invoked in this process)
Dir[ENV['RAILS_HOME'] + '/components/jobs/app/workers/*'].each do |f|
  puts "------ #{f} ---------"
  load f
end

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end

  every(1.minutes, 'log_cleaner.job ------') do

    args =  {}
    args['dir'] = ENV['RAILS_HOME'] + '/log'
    args['accepted_formats'] = %W(.log .txt)
    args['num_days'] = 2
    puts "---------------------------------"
    puts "Starting log cleaner from clockwork"
    puts args['dir']
    puts args['num_days']
    puts "---------------------------------"

    LogCleaner.perform_async(args, 3)

  end

end

