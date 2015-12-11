class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin
    valid_user = authenticate_with_http_basic { |u, p| u == SETTINGS['admin_username'] && p == SETTINGS['admin_password'] }
    if valid_user
      return true
    else
      request_http_basic_authentication
    end
  end


end
