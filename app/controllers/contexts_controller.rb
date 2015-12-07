class ContextsController < CruddyController

  # define any CRUD actions to override CruddyController

  def new
    @resource.creator = current_user
    @resource.save
    render 'cruddy/create'
  end

  private

  def context_params
    params.require(:context).permit(:name)
  end

end
