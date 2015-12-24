module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController

      # Temp
      skip_before_action :verify_authenticity_token

      def create

        build_resource(user_params)
        resource_saved = resource.save
        if resource_saved
          render :json=> resource.as_json(:only => [:authentication_token, :username, :id, :first_name, :last_name, :email]), :status=>201
          return
        else
          warden.custom_failure!
          render :json=> resource.errors, :status=>422
        end

        # user = User.create(user_params)
        # if user.save
        #   render :json=> user.as_json(:auth_token=>user.authentication_token, :username=>user.username), :status=>201
        #   return
        # else
        #   warden.custom_failure!
        #   render :json=> user.errors, :status=>422
        # end

      end

      private

      def user_params
        params.require(:user).permit('first_name', 'last_name', 'password', 'username', 'email', 'department', 'notes', 'admin', 'image_file_path', 'image_content_type', 'image_file_size')
        #params.require(:group).permit('id')
      end

    end
  end
end


