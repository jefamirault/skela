class AssignmentsController < CruddyController

  # define any CRUD actions to override CruddyController



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
    params.require(:assignment).permit(:title, :description, :due_date)
  end

end
