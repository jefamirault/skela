class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_courses

  private

  def add_owner(record)
    if logged_in?
      record.user = current_user
      record.save
    else
      @guest = User.create
      @guest.username = "Guest_#{@guest.id}"
      @guest.save

      session[:user_id] = @guest.id
      record.user = @guest
      record.save
    end
  end

  def set_courses
    @courses = logged_in? ? current_user.courses : []
  end

  def current_course
    if session[:course].nil?
      nil
    else
      Course.where(id: session[:course]).first
    end
  end
  helper_method :current_course

  def logged_in?
    !current_user.new_record?
  end
  helper_method :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      User.new
    end
  end
  helper_method :current_user

  def superuser?
    unless logged_in?
      return false
    end
    current_user.admin
  end
  helper_method :superuser?

  def authenticate
    redirect_to login_url unless logged_in?
  end
  def authorize_superuser
    redirect_to not_allowed_path, alert: 'Only an admin can do that' unless superuser?
  end
end
