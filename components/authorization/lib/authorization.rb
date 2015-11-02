require "authorization/engine"
require 'persistence'

module Authorization
  extend ActiveSupport::Concern

  # NOTE: Pay close attention. In order to delay the relationship until User class is
  # loaded, they are added to the included block below.
  # See http://www.fakingfantastic.com/2010/09/20/concerning-yourself-with-active-support-concern/

  included do
    has_and_belongs_to_many :groups, -> { uniq }
    has_and_belongs_to_many :roles, -> { uniq }
    has_many :application_objects
  end

  # additional methods can be added to following modules to extend Persistence::User
  module ClassMethods

  end

  module InstanceMethods

  end

end

# NOTE: Need to include superclass
class Persistence::User < ActiveRecord::Base
  include Authorization
end


