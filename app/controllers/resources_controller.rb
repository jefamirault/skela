class ResourcesController < CruddyController

  # define any CRUD actions to override CruddyController

  def show
    if request.xhr?
      render 'cruddy/read'
    else
      set_resource
      send_data(@resource.file_contents,
                type: @resource.content_type,
                filename: @resource.filename)
    end

  end

  def remove_file
    @resource = Resource.find params[:id]
    @resource.remove_file
  end

  private

  def resource_params
    params.require(:resource).permit(:description, :url, :file)
  end

end
