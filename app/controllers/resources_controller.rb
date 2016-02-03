class ResourcesController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def resource_params
    params.require(:resource).permit(:description, :url)
  end

end
