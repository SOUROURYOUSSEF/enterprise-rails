module Api
  module V1
    class ApplicationController < ActionController::Base
      respond_to :json

      protect_from_forgery with: :exception
      before_filter :authenticate_user!

    end
  end
end
