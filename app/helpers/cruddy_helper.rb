module CruddyHelper
  def cruddy_table(options)
    id = options[:resources].first.class.to_s.underscore.pluralize
    content_tag :ul, class: 'cruddy_table', id: id do
      options[:resources].map do |resource|
        content_tag :li, class: 'cruddy_resource', data: { resource_id: resource.id } do
          content_tag :div, class: 'compact' do
            render partial: options[:compact] || 'compact', locals: { resource: resource }
          end
        end
      end.reduce :+
    end
  end

  def crud_wrapper(resource, content, view = 'compact')
    content_tag :li, class: 'cruddy_resource', data: { resource_id: resource.id } do
      content_tag :div, class: view do
        content
      end
    end
  end

  def new_cruddy_resource(resource, hidden = false)
    content_tag :li, class: 'cruddy_resource', data: { resource_id: resource.id } do
      views = content_tag :div, class: 'compact', style: 'display:none;' do
        render partial: 'compact', locals: { resource: resource }
      end
      views += content_tag :div, class: 'full', style: hidden ? 'display:none;' : '' do
        render partial: 'full', locals: { resource: resource }
      end
      views
    end
  end

  def collapse_button
    content_tag 'div', class: 'collapse center' do
      md_icon 'expand_less'
    end
  end
end
