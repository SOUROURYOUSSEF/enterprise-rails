require 'fileutils'
require 'symmetric-encryption'
require_relative '../override_rake_tasks'

namespace :db do

  ENV['namespace'] = 'db'
  override_task  :migrate =>  :environment do |task, args|
    ActiveRecord::Base.configurations = YAML::load(ERB.new(IO.read(File.join(::Rails.root, 'config', 'database.yml'))).result)
    # delete any current migration files from top level db/migrate folder
    # Pathname.new(Rails.root.to_s + '/db/migrate').children.each { |p| p.unlink }
    engines = ['persistence','authorization', 'authentication', 'state_machines']
    engines.each do |engine|
      puts '---- Copying migrations from ' + engine + '----'
      `bundle exec rake #{engine}:install:migrations`
    end

    # To invoke the original task add ":original" to its name
    Rake::Task["db:migrate:original"].execute

  end

end