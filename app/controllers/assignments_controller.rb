class AssignmentsController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def assignment_params
    params.require(:assignment).permit()
  end

end
