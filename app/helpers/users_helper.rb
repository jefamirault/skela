module UsersHelper
  def edit_username_field
    form_for @user, remote: true do |f|
      f.text_field :username
    end
  end

  def destroy_user_link(user = @user, text = 'Delete User')
    confirmation = 'Are you sure you want to delete this user?'
    link_to text, user_path(user), method: :delete, id: 'delete_user', data: { user_id: user.id, confirm: confirmation, remote: true, fade_content: true, swap_title: 'Users' }
  end

end
