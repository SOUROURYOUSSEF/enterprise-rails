$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cms"
  s.version     = Cms::VERSION
  s.authors     = ["prakash-alpine"]
  s.email       = ["prakash0450@gmail.com"]
  s.homepage    = ""
  s.summary     = "Summary of CMS."
  s.description = "Description of CMS."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

#  s.add_dependency "locomotive-cms", "~> 4.2.4"

end
