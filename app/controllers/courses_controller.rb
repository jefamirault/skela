class CoursesController < CruddyController

  # define any CRUD actions to override CruddyController
  def index

  end

  def new
    @courses = current_user ? current_user.courses : []
  end

  def explore
    @course = Course.find params[:id]
    session[:course] = @course.id if @course
    @assignments = @course.assignments.order :due_date
    @exams       = @course.exams.order :datetime
    @readings    = @course.readings.order :due_date
    @resources   = @course.resources
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
    params.require(:course).permit(:title, :instructor, :instructor_email, :course_number, :location, :schedule)
  end

end
