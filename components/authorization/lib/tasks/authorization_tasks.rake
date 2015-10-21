# desc "Explaining what the task does"
namespace :authorization do
  task :seed do
    require "#{Persistence::Engine.root}/spec/dummy/config/environment"
    Authorization::Engine.load_seed
  end
end
