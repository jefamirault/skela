module ContextsHelper
  def activate_context(button_method = :big_button, context = @context, data = {})
    if session[:context].present? && @context.present? && session[:context] == @context.id
      text = 'Deactivate Context'
      path = deactivate_context_path
    else
      text = context.name
      path = activate_context_path context
    end
    def div(content, klass = nil)
      content_tag :div, content, class: "#{klass}"
    end
    def left(content, klass = nil)
      div content, "left #{klass}"
    end
    wrapped_text = div text, 'context_title'
    wrapped_icon = left md_icon(context.icon || 'chevron_right')

    clickable = wrapped_icon + wrapped_text

    selected = session[:context] == context.id

    data.merge! fade_content: true, swap_title: context.trackers.first.name

    send button_method, clickable, path, selected, data
  end

end
