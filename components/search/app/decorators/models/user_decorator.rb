# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do

  searchable do
    text :first_name
    text :last_name
    text :email

    text :groups do
      groups.map {|group| group.name}
    end
  end

end
