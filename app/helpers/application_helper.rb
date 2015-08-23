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

  def site_logo(options = {})
    path = 'skela_logo'

    unless options.empty?
      path << '_'
      path << options[:color]
    end

    path << '.svg'

    image_tag(path, style: 'width:135px; height:45px; vertical-align:middle; margin-bottom:2px;')
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
    controller_action? 'login', 'new_session'
  end

  def signing_up?
    controller_action? 'login', 'signup'
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
    link_to target.titleize, send("#{target}_path"), remote: true, class: klass, data: { path: target, parent: parent, fade_content: true }
  end

  def circle_add
    content_tag :i, class: 'material-icons md-icon md-48', style: 'color: #2d5daf' do
      'add_circle'
    end
  end

  def days_since(event)
    (Time.now - event.to_datetime).to_i / 3600 / 24
  end

  def get_next_weekday(weekday)
    weekday = "#{weekday.to_s}?".to_sym
    (Date.today..Date.today + 1.week).select{ |day| day.send weekday }.first
  end

  def publish_link(record)
    text = record.published ? '<i class="material-icons">visibility</i>'.html_safe : '<i class="material-icons">visibility_off</i>'.html_safe
    klass = record.class.to_s.underscore
    title = record.published ? 'Public' : 'Private'
    link_to(text, send("#{klass}_path", klass => { published: !record.published }, id: record.id), id: 'publish_link', title: title, data: { method: :put, remote: true })
  end
end
