class ContextsController < CruddyController

  # define any CRUD actions to override CruddyController

  def new
    @resource.creator = current_user
    @resource.save
    render 'cruddy/create'
  end

  def add_tracker
    @context = Context.find params[:id]
    @tracker = Tracker.find params[:tracker]
    @context.trackers << @tracker
  end
  def remove_tracker
    @context = Context.find params[:id]
    @tracker = Tracker.find params[:tracker]
    @context.trackers.delete @tracker
  end

  def activate
    @context = Context.find params[:id]
    session[:context] = @context.id
  end

  def deactivate
    @context = Context.find session[:context]
    session[:context] = nil
    @resources = Context.all
  end

  private

  def context_params
    params.require(:context).permit(:name, :icon)
  end

end
