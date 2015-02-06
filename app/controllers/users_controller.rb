class UsersController < ApplicationController

  before_filter :authorize, only: [:index, :edit, :destroy]

  def index
    @users = User.all
  end

  def update
    @user = User.find params[:id]
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated successfully!'
    end
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up, welcome to Skela!'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = User.find params[:id]
    if @user.destroy
      redirect_to users_path, notice: 'User successfully deleted!'
    end

  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
