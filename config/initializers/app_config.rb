#raw_config = File.read("#{::Rails.root}/config/app_config.yml")
# Use ERB to pre-process YAML file with embedded RAILS variables
# See http://stackoverflow.com/questions/6655767/how-to-use-yaml-in-a-rails-way

# Initialize APP_CONFIG only if database migrations are run. This will skip the APP_CONFIG while executing rake tasks such as rake db:migrate

if ActiveRecord::Base.connection.tables.include?('users')
  APP_CONFIG = YAML::load(ERB.new(IO.read(File.join(::Rails.root, 'config', 'app_config.yml.erb'))).result)[::Rails.env]
end
