module NavigationHelper
  def primary_nav_link(link_skel, options = {})
    if link_skel.class == Hash
      text = link_skel[:display]
      path = link_skel[:path]
      theme = link_skel[:theme]
    else
      text = link_skel.titleize
      path = '/' + link_skel
      theme = link_skel
    end
    link = link_to text, path, class: 'nav_link', remote: true, data: { theme: theme }
    if options.class == Hash && options[:drop_down]
      drop_down(options[:drop_down]) + link
    else
      link
    end
  end

  def primary_nav_links(link_skels)
    link_skels.map do |skel|
      primary_nav_link skel
    end.join.html_safe
  end

  def primary_nav_bar(skela)

  end

  def drop_down(skela)
    return ''.html_safe if skela == ''
    content_tag :ul, class: 'drop_down_nav' do
      skela.map do |skel|
        content_tag :li, primary_nav_link(skel)
      end.join.html_safe
    end
  end
end
