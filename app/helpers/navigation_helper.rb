module NavigationHelper
    def nav_link(text, path, title, options = {})
    klass = ''
    klass << 'nav_link' unless options[:no_nav]
    # klass << ' selected' if controller_name == title.underscore
    id = options[:page_title] ? 'page_title' : nil
    link_to text, path, id: id, class: klass, data: { remote: true, theme: '', fade_context: true, swap_title: title }
  end

  def path_for_tracker(tracker = @tracker)
    send "#{name.underscore}_path"
  end

  def navbar_link(title)
    link_to title, '', class: 'nav_link category_toggle', data: { remote: true, fade_content: true, swap_title: title }
  end
end
# send("#{title.pluralize.underscore}_path")

def category_link(title)
  content_tag :a, title, href: search_path(focus: { title.underscore => true }), class: 'category_link', data: { toggle: "#{title.underscore}_container" }
end
