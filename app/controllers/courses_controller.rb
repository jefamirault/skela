class CoursesController < CruddyController

  # define any CRUD actions to override CruddyController


  private

  def course_params
    params.require(:course).permit(:title, :instructor, :course_number, :location, :schedule)
  end

end
