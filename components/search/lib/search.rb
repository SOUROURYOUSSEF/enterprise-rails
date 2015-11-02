require "search/engine"
require "sunspot/rails/searchable"

module Search
  extend ActiveSupport::Concern
  include Sunspot::Rails::Searchable

  # NOTE: Pay close attention. In order to delay the relationship until User class is
  # loaded, they are added to the included block below.
  # See http://www.fakingfantastic.com/2010/09/20/concerning-yourself-with-active-support-concern/

  included do
    # searchable do
    #   text :first_name
    #   text :last_name
    #   text :email
    #
    #   text :groups do
    #     groups.map {|group| group.name}
    #   end
    #
    # end
  end

  # additional methods can be added to following modules to extend Persistence::User
  module ClassMethods

  end

  module InstanceMethods

  end

end

# NOTE: Need to include superclass ActiveRecord::Base for relationship declaration to work.
class Persistence::User < ActiveRecord::Base
  # include Sunspot::Rails::Searchable
  include Search
end
