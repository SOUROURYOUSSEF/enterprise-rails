$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'api'
  s.version     = Api::VERSION
  s.authors     = ['prakash-alpine']
  s.email       = ['prakash0450@gmail.com']
  s.homepage    = ''
  s.summary     = 'Summary of Api.'
  s.description = 'Description of Api.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.4'
  # https://github.com/rails-api/active_model_serializers
  # ActiveModelSerializers brings convention over configuration to your JSON generation.
  s.add_dependency 'active_model_serializers', '0.9.3'
  # https://github.com/Sutto/rocket_pants
  # RocketPants is a set of tools (built around existing toolsets such as ActionPack)
  # to make it easier to build well-designed APIs in Ruby and more importantly,
  # along side Rails.
  # s.add_dependency 'rocket_pants', '1.13.1'
  # NOTE: Latest version of wannabe_bool (0.3.0) requires ruby => 2.0 (JRuby 9.0.0.0). So I am using the older version here
  # See: https://github.com/prodis/wannabe_bool
  s.add_dependency 'wannabe_bool','0.0.1'

  s.add_dependency 'persistence', '0.0.1'
  s.add_dependency 'authentication'

end
