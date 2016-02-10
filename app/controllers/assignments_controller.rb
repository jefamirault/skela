class AssignmentsController < CruddyController

  # define any CRUD actions to override CruddyController

  def add_resource
    @assignment = Assignment.find params[:id]
    @resource = Resource.find_by_description params[:assignment][:new_resource]
    @assignment.resources << @resource
    redirect_to assignments_path
  end

  def remove_resource
    @assignment = Assignment.find params[:id]
    @resource = Resource.find params[:resource_id]
    @assignment.resources.delete @resource
    render nothing: true
  end

  private

  def create_resource
    @resource = Assignment.create
    @resource.course = current_course
    @resource.save
  end

  def set_resources
    @resources = current_course.assignments
  end

  def assignment_params
    params.require(:assignment).permit(:title, :description, :due_date, :new_resource)
  end

end
