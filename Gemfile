source 'https://rubygems.org'

path 'components' do
   gem 'persistence', '0.0.1'
   gem 'jobs', '0.0.1'
   gem 'authentication', '0.0.1'
   gem 'authorization', '0.0.1'
   gem 'api', '0.0.1'
   gem 'web_style', '0.0.1'
   gem 'sample_data', '0.0.1'
   gem 'search', '0.0.1'
 end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# Note: Even though the main application is not using Jbuilder, it needs to be declared here so that
# rails middleware gets initialized in correct sequence. You will still need to add add_dependency clause
# to engine's gemspec file.

gem 'jbuilder'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# respond_with and the class-level respond_to methods have been extracted to the responders gem.
# To use them, simply add gem 'responders', '~> 2.0' to your Gemfile
gem 'responders', '~> 2.0'

# Use jdbcsqlite3 as the database for Active Record
# gem 'activerecord-jdbcsqlite3-adapter'

# Devise is a flexible authentication solution for Rails based on Warden
# https://github.com/plataformatec/devise
gem 'devise'

platforms :jruby do
  # Had to lock net-ssh to 2.9.2 version. Latest version 3.1 requires Ruby 2.0
  gem 'net-ssh', '2.9.2'
  gem 'jruby-openssl', '0.9.6', :require => false
  gem 'activerecord-jdbcpostgresql-adapter', '1.3.7'
  # Use puma as the app server. See https://github.com/puma/puma
  gem 'puma'
  # Warbler is a gem to make a Java jar or war file out of any Ruby, Rails or Rack application.
  # Warbler provides a minimal, flexible, Ruby-like way to bundle up all of your application
  # files for deployment to a Java environment.
  gem 'warbler'
end

platforms :ruby do

  gem 'activerecord-postgresql-adapter'
  # Use puma as the app server. See https://github.com/puma/puma
  gem 'puma'

  group :development, :test do
    # Access an IRB console on exception pages or by using <%= console %> in views
    # web-console gem depends on bindng_of_caller gem that does not support JRuby
    # Please see http://stackoverflow.com/questions/33210259/bundle-install-error-with-jruby
    gem 'pry-rails'
    gem 'web-console', '~> 2.0'
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    # gem 'byebug'
    gem 'therubyracer'
  end

end

# gem 'sunspot_rails'
# gem 'sunspot_solr', :group => :development

# Use logging gem as a replacement of rails default logger
# See https://github.com/mcmire/logging-rails
gem 'logging-rails', :require => 'logging/rails'

# NOTE: You will need to install the `logging-email` gem to use this appender
# with loggging-2.0. The email appender was extracted into a plugin gem. That
# is the reason this code is commented out.
# See https://github.com/twp/logging-email
gem 'logging-email'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development do
  # Quiet Assets turns off the Rails asset pipeline log. This means that it suppresses messages in your development log
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'sdoc', '~> 0.4.0'
  gem 'annotate'
  gem 'less-rails'
  gem 'sass-rails'
  # Use CoffeeScript for .coffee assets and views
  gem 'coffee-rails', '~> 4.1.0'
  # Use Capistrano for deployment
  gem 'capistrano-rails'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  #gem 'progress_bar'
  gem 'foreman'
end

# group :test, :development do
#  gem 'rspec-rails'
#
# end
