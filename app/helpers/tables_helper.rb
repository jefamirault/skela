module TablesHelper
  def megatable(model_name, fields, resources = @resources)
    model_name = model_name.underscore
    content_tag :table, id: model_name.pluralize do
      header = content_tag :thead do
        content_tag :tr do
          fields.map do |field|
            content_tag(:th, field.titleize, data: { column: "#{model_name}_#{field}" })
          end.reduce(:+).html_safe
        end
      end

      body = content_tag :tbody do
        rows = ''
        if resources.empty?
          rows = content_tag :tr do
            content_tag :td, 'There\'s nothing here...', colspan: fields.size, class: 'nothing'
          end
        else
          resources.each do |resource|
            rows << megarow(resource, model_name, fields)
          end
        end
        rows.html_safe
      end


      header + body
    end
  end

  def megarow(resource, model_name, fields)
    klass = 'show_path'
    klass << cycle(' odd', ' even')
    edit_title = "Editing #{model_name.titleize}"

    content_tag :tr, data: { object_id: resource.id, swap_title: edit_title, fade_content: true }, class: klass do
      fields.map do |field|
        content_tag(:td, data: { column: "#{model_name}_#{field}" }) do
          content_tag(:span, class: "#{model_name}_#{resource.id}_#{field}") do
            value = resource.send(field)
            if value.class == Date
              value.strftime('%A, %B %d, %Y')
            elsif value.class == Time
              value.strftime('%-I:%M %p')
            elsif value.nil?
              '&nbsp;'.html_safe
            else
              value.to_s
            end

          end
        end
      end.reduce(:+).html_safe
    end
  end

end
