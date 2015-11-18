require 'sunspot'
require 'sunspot_rails'

module Searchable
  module Group

    def self.included(base)
      base.class_eval do
        include Sunspot::Rails::Searchable
        searchable do
          text :name
          text :description
        end
      end
    end

  end
end





