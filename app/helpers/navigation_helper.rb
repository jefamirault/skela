module NavigationHelper
  def primary_nav_link(link_skel)
    link_to link_skel[:display], link_skel[:path], class: 'nav_link', remote: true, data: { controller: link_skel[:controller] }
  end

  def primary_nav_bar(skela)

  end

  def drop_down(skela)

  end
end
