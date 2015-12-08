require 'sunspot'
require 'sunspot_rails'

module Searchable
  module User

    def self.included(base)
      if ENV['SOLR_ENABLED'] == 'true'
        base.class_eval do
          include Sunspot::Rails::Searchable
          searchable do
            text :first_name
            text :last_name
            text :email

            text :groups do
              groups.map {|group| group.name}
            end

          end
        end
      end
    end

  end
end






