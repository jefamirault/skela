class LoginController < ApplicationController
  def index

  end

  def new_session
    if logged_in?
      redirect_to welcome_path
    end
  end

  def create_session
    if logged_in?
      session[:user_id] = nil
    end
    user = User.find_by_username params[:username]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    end
    respond_to do |format|
      format.js
    end
  end

  def destroy_session
    session[:user_id] = nil

    respond_to do |format|
      format.js
    end
  end

  def signup
    @user = User.new
  end
end
