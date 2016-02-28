module SkelaFormsHelper
  def string_field(field, resource, options = {})
    form_for resource, html: { id: "edit_issue_#{field}", class: options[:class]}, remote: true do |f|
      f.text_field field, class: "ajax_field #{options[:class]}", id: options[:id]
    end
  end
end
