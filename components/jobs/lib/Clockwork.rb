module Clockwork
  configure do |config|
    config[:sleep_timeout] = 5
    config[:logger] = Logger.new("#{Rails.root}/log/clockwork.log")
    config[:tz] = 'EST'
    config[:max_threads] = 15
    config[:thread] = true
  end
  error_handler do |error|
    puts "-------------------"
    puts error.to_s
    puts "-------------------"
#    Airbrake.notify_or_ignore(error)
  end
end


