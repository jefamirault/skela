class ReadingsController < CruddyController

  # define any CRUD actions to override CruddyController


  def add_resource
    @reading = Reading.find params[:id]
    @resource = Resource.find_by_description params[:reading][:new_resource]
    @reading.resources << @resource
    redirect_to readings_path
  end

  def remove_resource
    @reading = Reading.find params[:id]
    @resource = Resource.find params[:resource_id]
    @reading.resources.delete @resource
    render nothing: true
  end


  private

  def create_resource
    @resource = Reading.create
    @resource.course = current_course
    @resource.save
  end

  def set_resources
    @resources = current_course.readings
  end

  def reading_params
    params.require(:reading).permit(:description, :due_date)
  end

end
