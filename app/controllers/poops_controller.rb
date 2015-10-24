class PoopsController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def poop_params
    params.require(:poop).permit()
  end

end
