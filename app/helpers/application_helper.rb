module ApplicationHelper
  def trigger_flash_notice
    link_to 'Flash Notice', '', id: 'trigger_flash_notice'
  end

  def trigger_flash_alert
    link_to 'Flash Alert', '', id: 'trigger_flash_alert'
  end

  def hide_stuff
    link_to 'Cloak Container', '', id: 'cloak_container'
  end

  def header_left(title = nil)
    logo = title || site_logo
    link_to logo, welcome_path, id: 'header_left', remote: true
  end

  def site_logo
    image_tag('skela_logo.svg', style: 'width:168px; height:64.5px; vertical-align:bottom')
  end

  def logged_in_text
    if logged_in?
      content_tag :div, id: 'logged_in_text' do
        content_tag(:strong, content_tag(:span, current_user.username, class: "user_#{current_user.id}_username"))
      end
    else
      'Logged out'
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

  def time_ago(datetime)
    "#{distance_of_time_in_words(Time.now, datetime)} ago"
  end

  def navigation_link(target, parent = target, routing_controllers = [])
    klass = 'nav_link'
    if params[:controller] == target
      klass << ' selected'
    else
      routing_controllers.each do |c|
        klass << ' selected' if params[:controller] == c
      end
    end
    link_to target.titleize, send("#{target}_path"), remote: true, class: klass, data: { path: target, parent: parent }
  end
end
