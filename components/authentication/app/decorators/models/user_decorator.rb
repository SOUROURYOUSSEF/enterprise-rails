# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :token_authenticatable is added to enable authetication over REST API.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # For Omniauth authentication
  has_many :authentications, :dependent => :delete_all

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end


end