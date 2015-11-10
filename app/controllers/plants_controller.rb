class PlantsController < CruddyController

  # define any CRUD actions to override CruddyController

  def update
    @plant.update plant_params
    render 'cruddy/update'
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :species, :birthday, :notes)
  end

end
