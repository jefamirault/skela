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
    redirect_to resources_path
  end

  def update
    @resource.update crud_params
    redirect_to resources_path
  end


  def autocomplete
    query = Resource.ransack(description_cont: params[:data], course_id_eq: current_course.id).result
    @suggestions = query.map do |resource|
      { label: resource.description, value: resource.description }
    end.to_json

    respond_to do |format|
      format.json { render json: @suggestions }
    end
  end

  private

  def create_resource
    @resource = Resource.create
    @resource.course = current_course
    @resource.save
  end

  def set_resources
    @resources = current_course.resources
  end

  def resource_params
    params.require(:resource).permit(:description, :url, :file)
  end

end
