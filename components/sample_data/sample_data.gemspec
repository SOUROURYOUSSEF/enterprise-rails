$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'sample_data/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'sample_data'
  s.version     = SampleData::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of SampleData.'
  s.description = 'Description of SampleData.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  # Note even though factory_girl_rails and faker are used during development, you have to add them
  # with add_dependency as per rails 4 documentation. add_development_dependency is used only during
  # testing. Weired.
  s.add_dependency 'rspec-rails'
  s.add_dependency 'factory_girl_rails', '4.4.1'
  s.add_dependency 'faker', '1.4.3'
  s.add_dependency 'persistence'

  # s.add_development_dependency 'activerecord-jdbcpostgresql-adapter', '1.3.7'
  
end
