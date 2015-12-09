# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :token_authenticatable is added to enable authetication over REST API.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



end