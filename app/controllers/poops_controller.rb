class PoopsController < CruddyController

  # define any CRUD actions to override CruddyController

  def update
    @poop.update poop_params
    render 'cruddy/update'
  end


  private

  def poop_params
    params.require(:poop).permit(:time, :rating)
  end

end
