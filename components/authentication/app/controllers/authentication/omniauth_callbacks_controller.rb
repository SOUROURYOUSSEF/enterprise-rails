module Authentication
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      @user = User.from_omniauth(request.env["omniauth.auth"], current_user)

      if @user.persisted?
        flash[:notice] = "You are in..!!! Go to edit profile to see the status for the accounts"
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        session["devise.user_attributes"] = @user.attributes
        redirect_to new_user_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

  end

end