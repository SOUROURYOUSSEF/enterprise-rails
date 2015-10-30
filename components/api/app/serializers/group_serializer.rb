# User serializer should not be namespaced since the corresponding model 'user' is not namespaced

class GroupSerializer < ActiveModel::Serializer
    attributes :id, :name, :description

    def initialize(object, options)
      super(object, options)
      @serialization_options = options[:serialization_options]
    end

    # NOTE: Here I am overriding the attributes method to conditionally include nested association objects.
    def attributes
        hash = super
        if serialization_options[:include_users] == true
            hash[:users] = self.users
        end
        if serialization_options[:include_scope] == true
            hash[:scope] = self.scope
        end
        return hash
    end


    # def initialize(arg1, arg2)
    #    super(arg1, arg2)
    # end

    def users
        users_array = []
        if serialization_options[:include_users] == true
            # NOTE: object here refers to the ActiveRecord model object. self refers to the serializer object itself.
            object.users.each do |user|
                # NOTE: You can pass serialization_options to serializable_hash.
                users_array << UserSerializer.new(user, {}).serializable_hash({})
            end
        end
        return users_array
    end

    def scope
        scope_hash = {}
        if serialization_options[:include_scope] == true
        # NOTE: object here refers to the ActiveRecord model object. self refers to the serializer object itself.
        # NOTE: note use of merge! vs. merge . merge! will replace original hash. merge will return a new hash
        scope_hash.merge! object.application_scope.slice(:id, :name, :description)
        end
        return scope_hash
    end

end

