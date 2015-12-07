class ContextsController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def context_params
    params.require(:context).permit(:name)
  end

end
