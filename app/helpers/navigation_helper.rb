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

    link = link_to display_text, path, class: 'nav_link', remote: true, data: { theme: theme }
    if options.class == Hash && options[:drop_down]
      link + drop_down(options[:drop_down], theme)
    else
      link
    end
  end

  def primary_nav_links(links)
    links.map do |link|
      primary_nav_link link
    end.join.html_safe
  end

  def primary_nav_bar(skela)

  end

  def drop_down(links = {}, theme = '')
    return ''.html_safe if links == ''
    content_tag :ul, class: 'drop_down_nav' do
      links.map do |link|
        content_tag :li, primary_nav_link(display: link[0], path: link[1], theme: theme)
      end.join.html_safe
    end
  end
end
