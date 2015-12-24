require_dependency 'api/v1/application_controller'

module Api
  module V1
    class UsersController <  Api::V1::ApplicationController
      respond_to :html, :js, :json

      def index
        if params[:include_groups].to_b == true
          @users = User.includes(:groups).all
        else
          @users = User.all
        end
        # NOTE: Using active_model_serializers to generate JSON data with customized meta data.
        # See: https://github.com/rails-api/active_model_serializers
        # NOTE: Note the use of 'to_b' method below. It is from a handy wannabe_bool gem that converts string, int, symbols into boolean.
        # See https://github.com/prodis/wannabe_bool
        render json: @users,  each_serializer: UserSerializer, include_groups: params[:include_groups].to_b, include_scope: params[:include_scope].to_b, meta: {total: User.count}

      end

      def show

        @user = User.find(params[:id])

        render json: @user, include_groups: params[:include_groups].to_b

        #respond_with()


      end

    end
  end
end
