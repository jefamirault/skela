module AjaxFormHelper

  def ajax_text(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += f.text_area field
      # form += f.submit
      form.html_safe
    end
  end

  def ajax_user_select(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += f.select field, options_for_select(User.all.map { |user| [user.email, user.id.to_s]}, @issue.send(field)), include_blank: true
      # form += f.submit
      form.html_safe
    end
  end

  def ajax_boolean(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += (f.label field) + (f.check_box field)
      # form += f.submit
      form.html_safe
    end
  end
end
