class UserSettingsController < ApplicationController

  # before_filter :authorize_current_user

  def toggle_header
    if params[:id] == 0
      render nothing: true
      return
    end
    set_user
    # @user.update(user_params)

    @user.show_header = !@user.show_header

    @user.save

    respond_to do |format|
      format.js
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_current_user
    unless current_user == @user
      redirect_to welcome_path, alert: 'You can only do that on your own account.'
    end
  end

  def user_params
    params.require(:user).permit(:show_header)
  end

end
