$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'web_style/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'web_style'
  s.version     = WebStyle::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of WebStyle.'
  s.description = 'Description of WebStyle.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  # Note: All gem dependencies are locked to a specific version so that they can not get
  # out of sync with same gems in another components. If two components have different
  # versions of gems, bundler will complain.

  s.add_dependency 'rails', '~> 4.2.4'

  s.add_development_dependency 'rspec-rails', '3.2.1'
  s.add_development_dependency 'less-rails', '2.7.0'
  s.add_development_dependency 'sass-rails', '5.0.4'

  s.add_dependency 'jquery-rails', '4.0.5'
  s.add_dependency 'therubyrhino', '2.0.4'
end
