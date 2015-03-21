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
    klass = 'show_path'
    klass << (options[:hidden] ? ' phased invisible' : '')
    content_tag :tr, data: { object_id: user.id }, class: klass do

      user_id_cell = content_tag :td do
        user.id.to_s
      end
      username_cell = content_tag :td, data: { column: 'user_username' } do
        content_tag :span, class: "user_#{user.id}_username" do
          user.username
        end
      end
      favorite_color_cell = content_tag :td do
        # link_to 'Edit', edit_user_path(user), remote: true, class: 'edit_user'
        user.favorite_color
      end
      email_cell = content_tag :td do
        'something@what.com'
      end
      (user_id_cell + username_cell + favorite_color_cell + email_cell).html_safe
      # username_cell.html_safe
    end
  end
end
