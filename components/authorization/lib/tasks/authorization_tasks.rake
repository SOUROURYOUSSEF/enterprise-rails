# desc "Explaining what the task does"
namespace :authorization do
  task :seed do
    require "#{::Rails.root}/config/environment"
    Authorization::Engine.load_seed
  end
end
