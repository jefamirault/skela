class CoursesController < CruddyController

  # define any CRUD actions to override CruddyController

  def index

  end


  def activate_course
    @course = Course.find params[:id]
    session[:course] = @course.id
    redirect_to courses_path
  end

  private

  def create_resource
    @resource = @course = Course.create
    add_owner @course
    session[:course] = @course.id
  end

  def set_resources
    @resources = @courses = if logged_in?
                 current_user.courses
               else
                 []
               end
  end

  def course_params
    params.require(:course).permit(:title, :instructor, :course_number, :location, :schedule)
  end

end
