module ContextsHelper
  def activate_context(button_method = :big_button, context = @context)
    if session[:context].present? && @context.present? && session[:context] == @context.id
      text = 'Deactivate Context'
      path = deactivate_context_path
    else
      text = context.name
      path = activate_context_path context
    end
    def left(content, klass = nil)
      content_tag :div, content, class: "left #{klass}"
    end
    wrapped_text = left text, 'context_title'
    wrapped_icon = left md_icon(context.icon || 'chevron_right')

    clickable = wrapped_icon + wrapped_text

    selected = session[:context] == context.id

    send button_method, clickable, path, selected
  end

end