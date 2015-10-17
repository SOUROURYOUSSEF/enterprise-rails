source 'https://rubygems.org'

path 'components' do
   gem 'persistence'
   gem 'authentication'
   gem 'authorization'
   gem 'web_style'
 end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# respond_with and the class-level respond_to methods have been extracted to the responders gem.
# To use them, simply add gem 'responders', '~> 2.0' to your Gemfile
gem 'responders', '~> 2.0'

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

# Devise is a flexible authentication solution for Rails based on Warden
# https://github.com/plataformatec/devise
gem 'devise'

# Use puma as the app server. See https://github.com/puma/puma
gem 'puma'



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  # Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0'
  gem 'quiet_assets'
  gem 'less-rails'
  gem 'sass-rails'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 4.1.0'
  # Use Capistrano for deployment
  gem 'capistrano-rails'
end


group :test, :development do
  gem 'rspec-rails'

end
