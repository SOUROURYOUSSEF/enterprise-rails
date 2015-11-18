# http://apidock.com/rails/Rails/Engine/load_seed/class
# Load data from db/seeds.rb file. It can be used in to load engines’ seeds, e.g.:
#    Blog::Engine.load_seed

namespace :sample_data do
  task :load do
    require "#{::Rails.root}/config/environment"
    SampleData::Engine.load_seed
  end
end
