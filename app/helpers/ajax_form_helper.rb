module AjaxFormHelper
  def ajax_form(type, resource, field)
    type = type_for_field(type)
    klass = type
    id = "#{resource.class.to_s.underscore}_#{resource.id}_#{field}"
    form_for resource, html: { id: "edit_issue_#{field}", class: klass }, remote: true do |f|
      f.send(type, field, class: "ajax_field #{type}", id: id)
    end
  end

  def type_for_field(field)
    case field.to_s
      when 'string', 'subject'
       'text_field'
      when 'notes', 'text'
       'text_area'
      else
       "#{field}_field"
     end
  end

  def user_select(form_builder, field, resource)
    form_builder.select field, options_for_select(User.all.map { |user| [user.username, user.id.to_s]}, resource.send(field)), { include_blank: true }, { class: 'ajax_field' }
  end

  def updated_field_at(field, object, options = {})
    klass = 'updated_at'
    klass << ' invisible' if options[:cloaked]
    content_tag :span, data: { field: field, id: object.id }, class: klass do
      if object.send field
      'updated: ' + object.send(field).in_time_zone('Eastern Time (US & Canada)').strftime('%B %e, %Y at %l:%M:%S %p')
      end
    end
  end

  def edit_field(object, field, type)
    ajax_form type, object, field
  end

  def add_field(object, field, type)
    content_tag :a, class: 'add', data: { add_field: true } do
      "Add #{field.to_s.titleize}".html_safe +
          content_tag(:template, edit_field(object, field, type), class: 'edit')
    end
  end

  def read_field(object, field, type)
    content_tag :span, class: 'read' do
      present(object).send(field).html_safe +
          content_tag(:template, edit_field(object, field, type), class: 'edit')
    end
  end

  def optional_field(object, field, type)
    content_tag :li, id: "#{object.class.to_s.underscore}_#{field}_add_edit_read" do
      label = content_tag(:label, field.to_s.titleize + ':', for: "#{object.class.to_s.underscore}_#{object.id}_#{field}")
      field = if object.send(field).nil? || !object.send(field).present?
                add_field object, field, type
              else
                read_field object, field, type
              end
      label + field
    end
  end

  def optional_fields(object, fields = {})
    content_tag :ul, class: 'optional_fields' do
      fields.map do |field, type|
        optional_field object, field, type
      end.reduce :+
    end
  end
end
