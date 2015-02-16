module UsersHelper
  def edit_username_field
    form_for @user, remote: true do |f|
      f.text_field :username
    end
  end

  def destroy_user_link(user = @user, text = 'Delete User')
    confirmation = nil
    # confirmation = 'Are you sure you want to delete this user?'
    link_to text, user_path(user), method: :delete, id: 'delete_user', data: { user_id: user.id, confirm: confirmation }, remote: true
  end

  def user_select_row(user, options = {})
    klass = options[:hidden] ? 'hidden invisible' : ''
    content_tag :tr, data: { user_id: user.id }, class: klass do
      username_cell = content_tag :td do
        content_tag :span, class: "user_#{user.id}_username" do
          user.username
        end
      end
      edit_cell = content_tag :td do
        link_to 'Edit', edit_user_path(user), remote: true, class: 'edit_user'
      end
      destroy_cell = content_tag :td do
        destroy_user_link user, 'Destroy'
      end
      (username_cell + edit_cell + destroy_cell).html_safe
    end
  end
end
