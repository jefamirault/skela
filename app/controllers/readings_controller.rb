class ReadingsController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def reading_params
    params.require(:reading).permit(:description, :due_date)
  end

end
