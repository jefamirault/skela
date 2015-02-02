class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      # render 'new'
    end

    respond_to do |format|
      format.js
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out successfully!'
  end
end
