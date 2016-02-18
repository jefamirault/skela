module NavigationHelper
  def primary_nav_link(options = {})
    if options.class == Array
      display_text = options[0]
      path =  options[1]
      theme = ''
    end

    display_text ||= options[:display]
    path ||= options[:path]
    theme ||= options[:theme]

    title = if options[:title] == false
      ''
    else
      options[:title] || display_text
    end

    if options.class == Hash && options[:drop_down]
      dropper = content_tag :div, display_text, class: 'dropper'
      dropper + drop_down(options[:drop_down], theme)
    else
      klass = ''
      klass << 'nav_link' unless options[:no_nav]
      selected = params[:controller] == options[:display].underscore
      klass << ' selected' if selected
      link = link_to display_text, path, class: klass, data: { remote: true, theme: theme, fade_content: true, swap_title: title }
      link
    end
  end

  def primary_nav_links(links)
    links.map do |link|
      primary_nav_link link
    end.join.html_safe
  end

  def nav_link(text, path, title, options = {})
    klass = ''
    klass << 'nav_link' unless options[:no_nav]
    klass << ' selected' if controller_name == title.underscore
    id = options[:page_title] ? 'page_title' : nil
    link_to text, path, id: id, class: klass, data: { remote: true, theme: '', fade_context: true, swap_title: title }
  end

  def drop_down(links = {}, theme = '')
    return ''.html_safe if links == ''
    content_tag :ul, class: 'drop_down_nav' do
      links.map do |link|
        content_tag :li, primary_nav_link(display: link[0], path: link[1], theme: theme)
      end.join.html_safe
    end
  end

  def path_for_tracker(tracker = @tracker)
    send "#{name.underscore}_path"
  end
end
