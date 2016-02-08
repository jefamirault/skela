class CoursesController < CruddyController

  # define any CRUD actions to override CruddyController

  def activate_course
    @course = Course.find params[:id]
    session[:course] = @course.id
    redirect_to assignments_path
  end

  private

  def course_params
    params.require(:course).permit(:title, :instructor, :course_number, :location, :schedule)
  end

end
