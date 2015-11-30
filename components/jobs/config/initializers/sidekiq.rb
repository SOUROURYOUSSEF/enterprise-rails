# Need to load app_config before using APP_CONFIG constant
require_relative '../../../../config/initializers/app_config'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{APP_CONFIG['redis']['host']}:#{APP_CONFIG['redis']['port']}" }
#   config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{APP_CONFIG['redis']['host']}:#{APP_CONFIG['redis']['port']}" }
#   config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }

end
