$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'authorization/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'authorization'
  s.version     = Authorization::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = 'https://github.com/prakash-alpine/enterprise-rails'
  s.summary     = 'Summary of Authorization.'
  s.description = 'Description of Authorization.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  # Note: All gem dependencies are locked to a specific version so that they can not get
  # out of sync with same gems in another components. If two components have different
  # versions of gems, bundler will complain.

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'devise', '3.4.1'
#  s.add_dependency 'jbuilder', '2.3.2'
  s.add_dependency 'responders', '2.1.0'

  s.add_development_dependency 'rspec-rails', '3.2.1'
  s.add_development_dependency 'factory_girl_rails', '4.4.1'
  s.add_development_dependency 'faker', '1.4.3'
  # https://github.com/thoughtbot/shoulda-matchers
  s.add_development_dependency 'shoulda-matchers', '2.8.0'
  # https://github.com/beatrichartz/shoulda-callback-matchers
  s.add_development_dependency 'shoulda-callback-matchers', '1.1.3'
  # Database Cleaner is a set of strategies for cleaning your database in Ruby.
  # The original use case was to ensure a clean state during tests.
  # Each strategy is a small amount of code but is code that is usually needed
  # in any ruby app that is testing with a database.
  # https://github.com/DatabaseCleaner/database_cleaner
  s .add_development_dependency 'database_cleaner', '1.3.0'

  # NOT CURRENTLY USED
  # gem 'capybara', '~> 2.4.3'
  #  gem 'launchy', '~> 2.4.2'
  #  gem 'selenium-webdriver', '~> 2.43.0'


end
