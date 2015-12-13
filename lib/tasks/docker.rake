require 'active_record'

namespace :docker do
  namespace :db do
    task :setup do
      #ActiveRecord::Base.configurations       = YAML::load(ERB.new(IO.read(File.join(::Rails.root, 'config', 'database.yml'))).result)[::Rails.env]
      #ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths
      # Generate assymetric keys for production environment if not already created. This should be created only Once.
      # SymmetricEncryption.load!
      if !File.exist?('/etc/rails/keys/enterprise_rails_production.key')
        Rake::Task[:'rails generate symmetric_encryption:new_keys production'].execute
      end
      begin
        Rake::Task[:'db:migrate'].invoke
      rescue ActiveRecord::NoDatabaseError
        puts 'Database does not exists. Creating new database..'
        # Note: Use execute instead of invoke. "invoke" tries to execute rake tasks in parallel which is not we want.
        ENV['SOLR_ENABLED'] = 'false'
        Rake::Task[:'db:create'].execute
        Rake::Task[:'db:migrate'].execute
        Rake::Task[:'sample_data:load'].execute
        Rake::Task[:'authorization:seed'].execute
        ENV['SOLR_ENABLED'] = 'true'
      end
    end
  end
end

