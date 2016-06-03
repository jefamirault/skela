class UsersController < CruddyController

  skip_before_filter :redirect_if_not_logged_in, only: [:create, :signup, :create_guest_account]
  skip_before_filter :set_courses, only: [:create, :signup, :create_guest_account]

  def index
    @users = superuser? ? User.all : [current_user]
    @resources = @users

    render 'cruddy/index'
  end

  def update
    @user = User.find params[:id]

    if @user == current_user && params[:user] && params[:user].any?
      @user.update(user_params)
    end
  end

  def signup
    @user = if params[:user]
              User.new user_params
            else
              User.new
            end
    render layout: 'login'
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to courses_path
    else
      redirect_to signup_path(user: user_params)
    end
  end

  def my_profile
    @user = current_user || User.guest
    session[:user_id] = @user.id
    respond_to do |format|
      format.html
      format.js
    end
  end

  def change_avatar
    @user = current_user
    @user.avatar = (@user.avatar + 1) % 6
    @user.save
  end

  def update_password
    @user = User.find params[:id]
    @user.update_password user_params
  end

  def create_guest_account
    @user = User.guest
    session[:user_id] = @user.id
    redirect_to courses_path
  end


  def autocomplete
    query = User.ransack(username_cont: params[:data]).result
    @suggestions = query.map do |user|
      { label: user.username, value: user.username }
    end.to_json

    respond_to do |format|
      format.json { render json: @suggestions }
    end
  end

  private

  def set_users
    @users = User.all
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :new_password, :avatar, :favorite_color)
  end

end
