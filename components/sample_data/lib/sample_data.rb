# NOTE: These gem files are required before requiring the engine itself. Even though these are
# declared as dependencies in the gemspec files. This is needed in order to run the tests
# inside of the engine without running the top level (included) application.

require 'factory_girl_rails'
require 'faker'

require "sample_data/engine"

module SampleData

end
