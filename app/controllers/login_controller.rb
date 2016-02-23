class LoginController < ApplicationController

  def new_session
    if logged_in?
      redirect_to welcome_path
    end
  end

  def create_session
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:course] = user.courses.first.id if user.courses.present?
      redirect_to courses_path
    end
  end

  def destroy_session
    session[:user_id] = nil
    session[:course] = nil
    @courses = Course.where(user_id: nil)
    respond_to do |format|
      format.js
      format.html { redirect_to welcome_path }
    end
  end

  def signup
    @user = User.new
  end
end
