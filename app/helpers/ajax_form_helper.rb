module AjaxFormHelper

  def ajax_text(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += f.text_area field, class: 'ajax_field'
      form.html_safe
    end
  end

  def ajax_string(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += f.text_field field, class: 'ajax_field'
      form.html_safe
    end
  end

  def ajax_number(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += f.number_field field, class: 'ajax_field'
      form.html_safe
    end
  end

  def ajax_user_select(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += user_select(f, field)
      form.html_safe
    end
  end
  def user_select(form_builder, field)
    form_builder.select field, options_for_select(User.all.map { |user| [user.email, user.id.to_s]}, @issue.send(field)), { include_blank: true }, { class: 'ajax_field' }
  end

  def ajax_boolean(field, resource = @resource)
    form_for resource, remote: true do |f|
      form = ''
      form += (f.label field) + (f.check_box field, class: 'ajax_field')
      form.html_safe
    end
  end


  def ajax_form(resource, fields)
    form_for resource, remote: true do |f|
      form = ''
      form += fields
      form.html_safe
    end
  end
end
