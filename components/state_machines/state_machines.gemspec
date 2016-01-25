$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'state_machines/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'state_machines'
  s.version     = StateMachines::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = 'http://enterprise-rails.leanrails.com'
  s.summary     = 'Component for managing state machines for active record objects'
  s.description = 'Component for managing state machines for active record objects'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'persistence', '0.0.1'
  s.add_dependency 'aasm', '4.7.0'

  s.add_development_dependency 'rspec-rails', '3.2.1'
  s.add_development_dependency 'factory_girl', '4.4.0'
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
  # Add a comment summarizing the current schema to the top or bottom of each of your model, fixtures, tests and specs
  # https://github.com/ctran/annotate_models
  s.add_development_dependency 'annotate', '2.6.10'
  
end
