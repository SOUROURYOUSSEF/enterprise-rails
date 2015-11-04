module Associable
  module User
    def self.included(base)
      base.class_eval do
        has_and_belongs_to_many :groups, -> { uniq }
        has_and_belongs_to_many :roles, -> { uniq }
        has_many :application_objects

        def hello
          puts "Hello !!!!"
        end

      end
    end

  end
end