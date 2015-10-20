module SampleData
  class Engine < ::Rails::Engine
    isolate_namespace SampleData

    # NOTE: Add paths to factories defined in other engines.
    initializer "model_core.factories", :after => "factory_girl.set_factory_paths" do
      FactoryGirl.definition_file_paths << File.expand_path("#{::Rails.root}/components/authorization/spec/factories", __FILE__)
      # FactoryGirl.find_definitions
    end

    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end


  end
end
