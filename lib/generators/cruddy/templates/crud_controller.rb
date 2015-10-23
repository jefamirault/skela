class CrudController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def crud_params
    params.require(:crud).permit()
  end

end
