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
  s.add_dependency 'persistence'
  s.add_development_dependency 'rspec-rails', '3.2.1'
  s.add_development_dependency 'shoulda-matchers', '2.8.0'
end
