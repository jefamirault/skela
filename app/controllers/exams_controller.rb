class ExamsController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def exam_params
    params.require(:exam).permit(:topic, :description, :datetime, :location)
  end

end