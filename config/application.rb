require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnterpriseRails
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Replace default test framework with rspec.
    # Only generate the spec files for model, controller and fixtures
    config.generators do|g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: true,
                       request_specs: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    # Skip email and password in log files
    config.filter_parameters += [:password, :password_confirmation, :email]

    #HandlebarsAssets::Config.template_namespace = 'JST'

    # TODO: THIS IS TEMP FOR TESTING IONIC MOBILE APP IN BROWSER. MUST BE REMOVED BEFORE
    # PUBLISHING APP TO PRODUCTION
    # Your Rails app will now be able to handle cross domain requests,
    # and the Ionic App will no longer complain when run alongside
    # Rails in the browser.
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :put, :delete, :post, :options]
      end
    end

  end
end
