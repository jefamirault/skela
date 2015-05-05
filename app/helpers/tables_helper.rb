module TablesHelper
  def megatable(model_name, fields)
    model_name = model_name.downcase
    content_tag :table, id: model_name.pluralize do
      header = content_tag :thead do
        content_tag :tr do
          cols = ''
          fields.each do |field|
            cols << content_tag(:th, field, data: { column: "#{model_name}_#{field}" })
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
    # klass << (options[:hidden] ? ' phased invisible' : '')

    content_tag :tr, data: { object_id: resource.id }, class: klass do
      cols = ''
      fields.each do |field|
        cols << content_tag(:td, data: { column: "#{model_name}_#{field}" }) do
          content_tag(:span, class: "#{model_name}_#{resource.id}_#{field}") do
            # binding.pry
            resource.send(field).to_s
          end
        end
      end

      # favorite_color_cell = content_tag :td do
      #   resource.favorite_color
      # end
      # email_cell = content_tag :td do
      #   'something@what.com'
      # end
      # (resource_id_cell + username_cell + favorite_color_cell + email_cell).html_safe
      cols.html_safe
    end
  end
end
