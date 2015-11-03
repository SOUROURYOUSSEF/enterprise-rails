require 'sunspot'
require 'sunspot_rails'

module UserSearch
  extend ActiveSupport::Concern

  # NOTE: Pay close attention. In order to delay the relationship until User class is
  # loaded, they are added to the included block below.
  # See http://www.fakingfantastic.com/2010/09/20/concerning-yourself-with-active-support-concern/

  included do
    searchable do
      string :first_name
      string :last_name
      string :email

      string :groups, :multiple => true do
        groups.map {|group| group.name}
      end
    end
  end

  # additional methods can be added to following modules to extend Persistence::User
  module ClassMethods
  end


end

# NOTE: Need to include superclass
class User < ActiveRecord::Base
  include Sunspot::Rails::Searchable
  include UserSearch
end






