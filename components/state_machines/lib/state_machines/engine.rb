require 'aasm'

module StateMachines
  class Engine < ::Rails::Engine
    isolate_namespace StateMachines

    # http://edgeguides.rubyonrails.org/engines.html#a-note-on-decorators-and-loading-code
    config.to_prepare do
      Dir.glob(StateMachines::Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

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
