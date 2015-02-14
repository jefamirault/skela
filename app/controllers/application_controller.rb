class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def logged_in?
    current_user ? true : false
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def superuser?
    unless logged_in?
      return false
    end
    current_user.is_superuser?
  end
  helper_method :superuser?

  def authenticate
    redirect_to login_url unless logged_in?
  end
  def authorize_superuser
    redirect_to welcome_path, alert: 'Only an admin can do that' unless superuser?
  end
end
