class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to welcome_path
    end
  end

  def create
    if current_user
      session[:user_id] = nil
    end
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Logged in successfully!'
    else
      flash[:alert] = 'Invalid Login'
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: 'Logged out successfully!'
  end
end
