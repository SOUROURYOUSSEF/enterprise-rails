#raw_config = File.read("#{::Rails.root}/config/app_config.yml")
# Use ERB to pre-process YAML file with embedded RAILS variables
# See http://stackoverflow.com/questions/6655767/how-to-use-yaml-in-a-rails-way
APP_CONFIG = YAML::load(ERB.new(IO.read(File.join(::Rails.root, 'config', 'app_config.yml.erb'))).result)[::Rails.env]
