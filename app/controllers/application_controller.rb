class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user


  protected

  def authenticate_user
    unless user_signed_in? || params[:controller][0..5] == 'devise'
      redirect_to new_user_session_path
    end
  end

  def resource_is_public?
    return true if params[:controller] == 'welcome'
    if params[:controller] == 'users'
      if params[:action] == 'sign_in' || params[:action] == 'sign_out'
        return true
      end
    end
    false
  end
end
