module ApplicationHelper
  def thing
    image_tag '//ssl.gstatic.com/accounts/ui/avatar_2x.png', height: 96, width: 96
  end


  def trigger_flash_notice
    link_to 'Flash Notice', '', id: 'trigger_flash_notice'
  end
  def trigger_flash_alert
    link_to 'Flash Alert', '', id: 'trigger_flash_alert'
  end
  def hide_stuff
    link_to 'Hide Stuff', '', id: 'hide_stuff'
  end

  def header_left(title = 'skela')
    link_to title, welcome_path, id: 'header_left'
  end

  def logged_in_text
    content_tag :div, id: 'logged_in_text' do
      "Logged in as #{content_tag(:strong, content_tag(:span, current_user.email, class: "user_#{current_user.id}_email"))}".html_safe
    end
  end

  def logging_in?
    params[:controller] == 'sessions' && params[:action] == 'new'
  end

  def signing_up?
    params[:controller] == 'users' && params[:action] == 'new'
  end

end
