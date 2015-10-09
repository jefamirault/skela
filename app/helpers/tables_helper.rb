module TablesHelper
  def megatable(model_name, fields, resources = @resources)
    model_name = model_name.underscore
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
      cols = ''
      fields.each do |field|
        cols << content_tag(:td, data: { column: "#{model_name}_#{field}" }) do
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
      end

      cols.html_safe
    end
  end

  def supertable(resources, fields = {})
    model = resources.first.class.to_s.downcase
    content_tag :table, id: model.pluralize do
      header = content_tag :thead do
        content_tag :tr do
          cols = ''
          fields.map do |field, options|
            formatted_field = field.titleize

            cols << content_tag(:th, formatted_field, data: { column: "#{model}_#{field}" })
          end
          cols.html_safe
        end
      end

      body = content_tag :tbody do
        rows = ''
        resources.each do |resource|
          rows << superrow(resource, fields)
        end
        rows.html_safe
      end

      header + body
    end
  end

  def superrow(resource, fields)
    model = resource.class.to_s.downcase
    klass = 'show_path'
    klass << cycle(' odd', ' even')
    content_tag :tr, data: { object_id: resource.id }, class: klass do
      cols = ''
      fields.map do |field, options|
        field = field.downcase
        cols << content_tag(:td, data: { column: "#{model}_#{field}" }) do
          content_tag(:span, class: "#{model}_#{resource.id}_#{field}") do
            value = resource.send(field)
            if value.class == Date
              value.strftime('%A, %B %d, %Y')
            elsif value.class == Time
              value.strftime('%-I:%M %p')
            else
              value.to_s
            end

          end
        end
      end

      cols.html_safe
    end
  end
end
