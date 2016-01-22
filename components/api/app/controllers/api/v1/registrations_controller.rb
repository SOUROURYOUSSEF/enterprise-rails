require 'twilio-ruby'

module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController

      # Temp
      skip_before_action :verify_authenticity_token

      def create
        # for case when email is used for login, copy email address to username.
        # Note: email address in username field in not encrypted.
        if params['mobile_registration'].to_b == true
          params['user']['username'] = params['user']['email']
          # for mobile registration, password is created in step 3 after the mobile
          # phone number is verified. So use a random password as a place holder.
          params['user']['password'] = Array.new(8){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
        end

        if User.where(:username => params['user']['email']).first != nil
          render :json=> {:success=>false, :error=> 'Email is already taken.'}, :status=>422
          return
        end

        build_resource(user_params)
        resource_saved = resource.save
        if resource_saved
          #resource.mobile_verification_pin = rand(0000..9999).to_s.rjust(4, '0')
          resource.update_attribute(:mobile_verification_pin, rand(0000..9999).to_s.rjust(4, '0'))
          if params['mobile_registration'].to_b == true
            send_mobile_verification_pin(resource)
            send_email_verification_code(resource)
          end
          render :json=> resource.as_json(:only => [:authentication_token, :username, :id, :first_name, :last_name, :email, :mobile_phone, :mobile_verification_pin]), :status=>201
          return
        else
          warden.custom_failure!
#          render :json=> {:success=>false, :error=> resource.errors}, :status=>422
          render :json=> {:success=>false, :error=> 'Failed to sign up'}, :status=>422
          return
        end

      end

      def verify_mobile
        user = User.find(params['id'])
        if user.mobile_verification_pin == params['mobile_verification_pin']
          user.update_attribute(:mobile_verification_confirmed_at, Time.now)
          render :json =>  user.as_json(:only => [:authentication_token, :username, :mobile_phone, :mobile_verification_pin ]), :status=>200
          return
        else
          render :json=> {:success =>false, :error=> 'Invalid pin. Please try again.'}, :status=>422
          return
        end

      end

      def update_password
        user = User.find(params['id'])
        user.password = params['password']
        if user.save
          render :json =>  user.as_json(:only => [:authentication_token, :username, :mobile_phone, :mobile_verification_pin ]), :status=>200
          return
        else
          render :json=> {:success =>false, :error=> 'Invalid pin. Please try again.'}, :status=>422
          return
        end

      end

      private

      def user_params
        params.require(:user).permit('first_name', 'last_name', 'password', 'username', 'email', 'mobile_phone', 'mobile_registration', 'department', 'notes', 'admin', 'image_file_path', 'image_content_type', 'image_file_size')
        #params.require(:group).permit('id')
      end

      def send_mobile_verification_pin(user)
        twilio_client = Twilio::REST::Client.new APP_CONFIG['twilio']['account_sid'], APP_CONFIG['twilio']['auth_token']
        twilio_client.messages.create(
            from: APP_CONFIG['twilio']['phone_number'],
            to: user.mobile_phone,
            body: "Welcome to Winston. Enter #{user.mobile_verification_pin} on the sign up page to verify your mobile number. Type HELP for help, STOP to cancel."
        )
        user.mobile_verification_sent_at = Time.now
      end

      # Sends email notification for registration
      def send_email_verification_code(user)
        Persistence::UserMailer.welcome_email(user).deliver_now
        user.email_verification_sent_at = Time.now
      end

    end
  end
end


