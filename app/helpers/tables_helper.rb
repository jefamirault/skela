module TablesHelper
  def megatable(model_name, fields)
    model_name = model_name.downcase
    content_tag :table, id: model_name.pluralize do
      header = content_tag :thead do
        content_tag :tr do
          cols = ''
          fields.each do |field|
            formatted_field = field.titleize

            cols << content_tag(:th, formatted_field, data: { column: "#{model_name}_#{field}" })
          end
          cols.html_safe
        end
      end

      body = content_tag :tbody do
        rows = ''
        @resources.each do |resource|
          rows << megarow(resource, model_name, fields)
        end
        rows.html_safe
      end


      header + body
    end
  end

  def megarow(resource, model_name, fields)
    klass = 'show_path'

    content_tag :tr, data: { object_id: resource.id }, class: klass do
      cols = ''
      fields.each do |field|
        cols << content_tag(:td, data: { column: "#{model_name}_#{field}" }) do
          content_tag(:span, class: "#{model_name}_#{resource.id}_#{field}") do
            resource.send(field).to_s
          end
        end
      end

      cols.html_safe
    end
  end
end
