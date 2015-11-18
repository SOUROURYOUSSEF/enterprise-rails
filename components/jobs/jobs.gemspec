$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'jobs/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'jobs'
  s.version     = Jobs::VERSION
  s.platform    = 'ruby'
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of Jobs.'
  s.description = 'Description of Jobs.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['spec/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  s.add_dependency 'sidekiq', '~> 3.5.3'
  s.add_dependency  'clockwork', '1.2.0'
#  s.add_dependency  'daemons',  '1.2.3'
#  s.add_dependency  'clockworkd', '0.2.5'

  s.add_development_dependency 'rspec-rails', '3.2.1'
  s.add_development_dependency 'factory_girl_rails', '4.4.1'
  s.add_development_dependency 'faker', '1.4.3'

end
