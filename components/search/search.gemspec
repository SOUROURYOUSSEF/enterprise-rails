$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'search/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'search'
  s.version     = Search::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of Search.'
  s.description = 'Description of Search.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'sunspot_rails',  '2.2.0'

  # Why do I need to add these here?
  # s.add_dependency  'gretel', '3.0.8'

  s.add_development_dependency 'sunspot_solr', '2.2.0'
  #s.add_dependency 'activerecord-postgresql-adapter'
end
