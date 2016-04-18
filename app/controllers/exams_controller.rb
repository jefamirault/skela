class ExamsController < CruddyController
  include ResourcefulController

  # define any CRUD actions to override CruddyController

  private

  def create_resource
    @resource = Exam.create
    @resource.course = current_course
    @resource.save
  end

  def set_resources
    @resources = current_course.exams
  end

  def exam_params
    params.require(:exam).permit(:title, :description, :datetime, :location)
  end

end
