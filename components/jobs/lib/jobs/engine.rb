require 'sidekiq'
require 'clockwork'

module Jobs
  class Engine < ::Rails::Engine
    isolate_namespace Jobs

    # http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    config.autoload_paths += %W(\#{config.root}/lib)

  end
end
