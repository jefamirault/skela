class UsersController < ApplicationController

  before_filter :authenticate, except: [:index, :admin_new, :edit, :new, :create]
  before_filter :authorize_superuser, only: [:admin_create]

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @user = User.find params[:id]
    if params[:user] && params[:user].include?(:privilege_level)
      if superuser?
        @user.privilege_level = params[:user][:privilege_level]
      else
        flash[:alert] = 'Get the fuck out of here.'
        session[:user_id] = nil
        return
      end
      params[:user].delete :privilege_level
    end
    unless superuser?
      if @user != current_user
        flash[:alert] = 'You cannot edit someone else\'s profile.'
        return
      end
    end
    if params[:user] && params[:user].any?
      if @user.update(user_params)
        flash[:notice] = 'User updated successfully!'
      else
        flash[:alert] = 'Something happened'
      end
    else
      if @user.save
        flash[:notice] = 'User updated successfully!'
      else
        flash[:alert] = 'Something happened'
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    if User.find_by_username params[:user][:username]
      # flash[:alert] = 'That username is taken'
    else
      @user = User.create(user_params)
      if @user.valid?
        session[:user_id] = @user.id
      end
    end

    respond_to do |format|
      format.js
    end
  end

  def edit
    @user = User.find params[:id]
    set_users
    respond_to do |format|
      format.js
      format.html
    end
  end

  def destroy
    @user = User.find params[:id]

    if current_user == @user || superuser?
      @user.destroy
    else
      flash[:alert] = 'Only an admin can do that.'
    end

  end

  def admin_new
    @user = User.new
    respond_to do |format|
      format.js
    end
  end

  def admin_create
    if @user = User.create(user_params)
      flash[:notice] = 'User created successfully!'
    else
      flash[:alert] = 'No good'
    end
    respond_to do |format|
      format.js
    end
  end

  def my_profile
    @user = current_user

    respond_to do |format|
      format.html
      format.js
    end
  end

  def not_allowed
    respond_to do |format|
      format.js
    end
  end

  private

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar, :favorite_color)
  end

end
