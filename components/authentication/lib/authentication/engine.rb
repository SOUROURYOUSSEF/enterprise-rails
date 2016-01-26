require 'devise'
require 'omniauth'
require 'omniauth-facebook'
require 'oauth2'
require 'koala'

module Authentication
  class Engine < ::Rails::Engine
    isolate_namespace Authentication

    # http://edgeguides.rubyonrails.org/engines.html#a-note-on-decorators-and-loading-code
    config.to_prepare do
      Dir.glob(Authentication::Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
      # Uncomment following lines if you want to customizable layout for Devise controllers.
      #Devise::SessionsController.layout 'devise'
      #Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? 'application' : 'devise' }
      #Devise::ConfirmationsController.layout 'devise'
      #Devise::UnlocksController.layout 'devise'
      #Devise::PasswordsController.layout 'devise'
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
    end

  end
end
