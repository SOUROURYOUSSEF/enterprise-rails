require 'aasm'

# Add instance methods specific to devise gem to User model.
# It assumes you have a model called User. If not, change the name below
# to your user model name.

User.class_eval do
  include AASM

  aasm do
    # USER REGISTRATION
    state :unregistered, :initial => true
    state :name_provided            # User has provided valid firstname and lastname
    state :contact_provided         # User has provided valid email and mobile phone #
    state :mobile_verified          # User has verified mobile phone number
    state :email_verified           # User has verified email address
    state :household_provided       # User has provided household information
    state :password_provided        # User has provided password
    state :unregistered             # User is fully registered

    # RECOVER EMAIL ADDRESS


    # RECOVER PASSWORD



    event :named do
      transitions :from => :unregistered, :to => :name_provided
    end

    event :contacted do
      after do
        send_mobile_verification_pin
        send_email_verification_code
      end
      transitions :from => :name_provided, :to => :contact_provided
    end
  end

  def send_mobile_verification_pin
    twilio_client = Twilio::REST::Client.new APP_CONFIG['twilio']['account_sid'], APP_CONFIG['twilio']['auth_token']
    twilio_client.messages.create(
        from: APP_CONFIG['twilio']['phone_number'],
        to: self.mobile_phone,
        body: "Welcome to Winston. Enter #{self.mobile_verification_pin} on the sign up page to verify your mobile number. Type HELP for help, STOP to cancel."
    )
    self.mobile_verification_sent_at = Time.now
  end

  # Sends email notification for registration
  def send_email_verification_code
    Persistence::UserMailer.welcome_email(self).deliver_now
    self.email_verification_sent_at = Time.now
  end

end