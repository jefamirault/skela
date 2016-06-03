module AjaxFormHelper
  def ajax_form(type, resource, field)
    klass = type
    id = "#{resource.class.to_s.underscore}_#{resource.id}_#{field}"
    form_for resource, html: { id: "edit_issue_#{field}", class: klass}, remote: true do |f|
      case type.to_s
        when 'user_select'
          user_select f, field, resource
        when 'number'
          f.number_field field, class: 'ajax_field', id: id
        when 'string'
          f.text_field field, class: 'ajax_field', id: id
        when 'notes'
          f.text_area field, class: 'ajax_field notes', placeholder: 'Notes', id: id
        when 'subject'
          f.text_field field, class: 'ajax_field subject', placeholder: "New #{resource.class}", id: id
        when 'text'
          f.text_area field, class: 'ajax_field', id: id
        when 'boolean'
          (f.label field) + (f.check_box field, class: 'ajax_field')
        when 'datetime'
          value = if resource.send(field)
                    resource.send(field).in_time_zone('Eastern Time (US & Canada)').strftime('%FT%R')
                  else
                    nil
                  end
          f.datetime_local_field field, class: 'ajax_field', value: value
        when 'time'
          f.time_field field, class: 'ajax_field', id: id
        when 'date'
          f.date_field field, class: 'ajax_field', id: id
      end
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
