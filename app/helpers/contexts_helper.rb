module ContextsHelper
  def activate_context_button(context = @context)
    if session[:context].present? && @context.present? && session[:context] == @context.id
      big_button 'Deactivate Context', deactivate_context_path
    else
      big_button 'Activate Context', activate_context_path(context)
    end
  end
end
