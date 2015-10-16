$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "frontend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "frontend"
  s.version     = Frontend::VERSION
  s.authors     = ["prakash-alpine"]
  s.email       = ["prakash0450@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Frontend."
  s.description = "TODO: Description of Frontend."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "activerecord-jdbcsqlite3-adapter"
end
