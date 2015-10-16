$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "integration/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "integration"
  s.version     = Integration::VERSION
  s.authors     = ["prakash-alpine"]
  s.email       = ["prakash0450@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Integration."
  s.description = "TODO: Description of Integration."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
