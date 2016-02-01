# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do

  # For omniauth providers
  has_many :auth_providers

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :token_authenticatable is added to enable authetication over REST API.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable,
         :omniauthable, :omniauth_providers => [:facebook]

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  def self.new_with_session(params,session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def self.from_omniauth(auth, current_user)
    auth_provider = AuthProvider.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
    if auth_provider.user.blank?
      user = current_user || User.where('encrypted_email = ?', SymmetricEncryption.encrypt(auth['info']['email'])).first
      if user.blank?
        user = User.new
        user.password = Devise.friendly_token[0,10]
        user.first_name = auth.info.name.partition(' ').first
        user.last_name = auth.info.name.partition(' ').last
        user.username = auth.info.email
        user.email = auth.info.email
        # place user in the default group for now.
        user.groups << Group.find_by(:name => 'default_group')
        if auth.provider == 'twitter'
          user.save(:validate => false)
        else
          user.save!
        end
      end
      auth_provider.username = auth.info.name.parameterize.underscore
      auth_provider.user_id = user.id
      user.auth_providers << auth_provider
      auth_provider.save!
    end
    auth_provider.user
  end


end