module Authorization
  class ApplicationController < ActionController::Base
    layout 'web_style/admin'
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    before_filter :authenticate_user!

  end
end
