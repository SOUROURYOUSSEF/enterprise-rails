require 'rails/all'

# require 'active_record'
require 'symmetric-encryption'

namespace :docker do
  namespace :db do
    task :setup, [:reset] => :environment do |t, args|
      #if !File.exist?("/etc/rails/keys/enterprise_rails_#{Rails.env}.key")
      #  puts "-----------------------"
      ##  puts "Generating encryption keys for production"
      #  `bundle exec rails generate symmetric_encryption:new_keys #{Rails.env}`
      #  puts "-----------------------"
      #end
      #ActiveRecord::Base.configurations       = YAML::load(ERB.new(IO.read(File.join(::Rails.root, 'config', 'database.yml'))).result)
      #ActiveRecord::Migrator.migrations_paths = ActiveRecord::Tasks::DatabaseTasks.migrations_paths

      begin
        SymmetricEncryption.load!
        if args[:reset] == 'true'
          puts 'Resetting the Database..'
          ENV['SOLR_ENABLED'] = 'false'
          puts "---- Dropping database ----"
          Rake::Task[:'db:drop'].execute
          puts "---- Creating databae ----"
          Rake::Task[:'db:create'].execute
          puts "---- Migrating database ----"
          Rake::Task[:'db:migrate'].execute
          puts "---- Loading sample data ----"
          Rake::Task[:'sample_data:load'].execute
          puts "---- Seeding authorization data ----"
          Rake::Task[:'authorization:seed'].execute
          ENV['SOLR_ENABLED'] = 'true'
        else
          # Rake::Task[:'db:migrate'].invoke
        end
      rescue ActiveRecord::NoDatabaseError
        puts 'Database does not exists.'

        # ENV['SOLR_ENABLED'] = 'false'
        # puts "---- Dropping database ----"
        # Rake::Task[:'db:drop'].execute
        # puts "---- Creating databae ----"
        # Rake::Task[:'db:create'].execute
        # puts "---- Migrating database ----"
        # Rake::Task[:'db:migrate'].execute
        # puts "---- Loading sample data ----"
        # Rake::Task[:'sample_data:load'].execute
        # puts "---- Seeding authorization data ----"
        # Rake::Task[:'authorization:seed'].execute
        # ENV['SOLR_ENABLED'] = 'true'

      end
    end
  end
end

