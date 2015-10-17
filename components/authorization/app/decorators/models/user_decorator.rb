# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do

  # add relationships to User model
  has_and_belongs_to_many :groups, -> { uniq }
  has_and_belongs_to_many :roles, -> { uniq }
  has_many :application_objects

end