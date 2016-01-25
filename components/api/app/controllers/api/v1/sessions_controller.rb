module Api
  module V1
   class SessionsController < Devise::SessionsController

     # Temp
     skip_before_action :verify_authenticity_token

     # prepend_before_filter :require_no_authentication, :only => [:create ]

     before_filter :authenticate_user!, :except => [:create, :destroy]

     before_filter :ensure_params_exist

     respond_to :json

     def create
       # build_resource
       resource = User.find_for_database_authentication(:username=>params['username'])
       return invalid_login_attempt unless resource

       if resource.valid_password?(params['password'])
         sign_in("user", resource)
         render :json=> {:success=>true, :auth_token=>resource.authentication_token, :username=>resource.username, :email=>resource.email}
         return
       end
       invalid_login_attempt
     end

     def destroy
       sign_out(resource_name)
     end

     # Build a devise resource passing in the session. Useful to move
     # temporary session data to the newly created user.
     def build_resource(hash=nil)
       self.resource = resource_class.new_with_session(hash || {}, session)
     end

     protected
     def ensure_params_exist
       return unless params[:username].blank?
       render :json=>{:success=>false, :error=>"missing user_login parameter"}, :status=>422
     end

     def invalid_login_attempt
       warden.custom_failure!
       render :json=> {:success=>false, :error=>"Invalid login or password"}, :status=>401
     end

   end
  end
end