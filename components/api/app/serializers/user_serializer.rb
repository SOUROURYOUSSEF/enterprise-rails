# User serializer should not be namespaced since the corresponding model 'user' is not namespaced

class UserSerializer < ActiveModel::Serializer
    attributes :id, :first_name, :last_name, :username, :email

    # NOTE: Here I am overriding the attributes method to conditionally include nested association objects.
    def attributes
      hash = super
      if serialization_options[:include_groups] == true
        group_array = []
        if object.groups.count != 0
          object.groups.each do |group|
            # NOTE: call serializable_hash directly to pass the serialization_options. See serializer.rb->serializable_object
            group_array << GroupSerializer.new(group, {}).serializable_hash({:include_scope => true})
          end
          hash[:groups] = group_array
        end
      end
      return hash
    end

end

