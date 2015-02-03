class UsersController < ApplicationController

  before_filter :authorize, only: [:index, :edit, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_url, notice: 'Thank you for signing up!'
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
