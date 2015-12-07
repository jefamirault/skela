class TrackersController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def tracker_params
    params.require(:tracker).permit(:name)
  end

end
