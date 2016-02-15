class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to welcome_path
    end
  end

  def create
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:course] = user.courses.first.id if user.courses.present?
      redirect_to courses_path
    end
  end

  def destroy
    session[:user_id] = nil

    respond_to do |format|
      format.js
    end
  end
end
