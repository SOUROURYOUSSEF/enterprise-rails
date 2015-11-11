require 'sunspot'
require 'sunspot_rails'

module Searchable
  module ApplicationScope

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






