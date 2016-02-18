class ReadingsController < CruddyController
  include ResourcefulController

  # define any CRUD actions to override CruddyController

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
