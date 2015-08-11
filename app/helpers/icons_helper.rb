module IconsHelper
  def trash_icon_right
    content_tag :i, 'delete', class: 'material-icons right'
  end
  def trash_icon
    content_tag :i, 'delete', class: 'material-icons'
  end
end
