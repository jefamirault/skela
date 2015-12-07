class PlantsController < CruddyController

  # define any CRUD actions to override CruddyController

  private

  def plant_params
    params.require(:plant).permit(:name, :species, :birthday, :notes)
  end

end
