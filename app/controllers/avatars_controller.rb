class AvatarsController < ApplicationController

  before_filter :set_avatar

  def change_face
    @avatar.increment_face
    render 'update'
  end

  def change_head
    @avatar.increment_head
    render 'update'
  end

  def change_color
    @avatar.increment_color
    render 'update'
  end

  private

  def set_avatar
    @avatar = current_user.avatar
    if @avatar.nil?
      @avatar = Avatar.create
      current_user.avatar = @avatar
    end
  end

  def avatar_params
    params.require(:avatar).permit(:face, :head, :color)
  end
end
