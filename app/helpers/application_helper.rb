module ApplicationHelper
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
      "Logged in as #{content_tag(:strong, content_tag(:span, current_user.username, class: "user_#{current_user.id}_username"))}".html_safe
    end
  end

  def logging_in?
    controller_action? 'sessions', 'new'
  end

  def signing_up?
    controller_action? 'users', 'new'
  end

  def controller_action?(controller, action)
    params[:controller] == controller && params[:action] == action
  end

end
