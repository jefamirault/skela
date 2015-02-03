module ApplicationHelper
  def thing
    image_tag '//ssl.gstatic.com/accounts/ui/avatar_2x.png', height: 96, width: 96
  end

  def header_left(title = 'skela')
    content_tag :div, title, id: 'header_left'
  end

  def logged_in_text
    content_tag :div, id: 'logged_in_text' do
      "Logged in as #{content_tag(:strong, current_user.email)}".html_safe
    end
  end
end
