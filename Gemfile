source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

# Use jdbcsqlite3 as the database for Active Record
# gem 'activerecord-jdbcsqlite3-adapter'

platform :jruby do
  # Had to lock net-ssh to 2.9.2 version. Latest version 3.1 requires Ruby 2.0
  gem 'net-ssh', '2.9.2'
  gem 'jruby-openssl', '0.9.6', :require => false
  gem 'activerecord-jdbcpostgresql-adapter', '1.3.7'
end

# Use logging gem as a replacement of rails default logger
# See https://github.com/mcmire/logging-rails
gem 'logging-rails', :require => 'logging/rails'

# Use puma as the app server. See https://github.com/puma/puma
gem 'puma'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

=begin
path 'components' do
  gem 'persistence'
  gem 'frontend'
  gem 'api'
  gem 'integration'
  gem 'authentication'
  gem 'authorization'
  gem 'web_style'
end
=end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  # Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log
  gem 'quiet_assets'

  # Use Capistrano for deployment
  gem 'capistrano-rails'
end


group :test, :development do
  gem 'rspec-rails'

end
