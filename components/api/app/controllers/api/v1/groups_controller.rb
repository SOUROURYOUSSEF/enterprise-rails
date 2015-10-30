require_dependency 'api/v1/application_controller'

module Api
  module V1
    class GroupsController <  ApplicationController
      respond_to :html, :js, :json

      def index
        @groups = Group.all

        # NOTE: Using active_model_serializers to generate JSON data with customized meta data.
        # See: https://github.com/rails-api/active_model_serializers
        # NOTE: Note the use of 'to_b' method below. It is from a handy wannabe_bool gem that converts string, int, symbols into boolean.
        # See https://github.com/prodis/wannabe_bool
        render json: @groups,  each_serializer: GroupSerializer, include_users: params[:include_users].to_b, include_scope: params[:include_scope].to_b, meta: {total: Group.count}

      end

      def show

        @group = Group.find(params[:id])

        render json: @group, include_users: params[:include_users].to_b, include_scope: params[:include_scope].to_b

        #respond_with()

      end

    end
  end
end
