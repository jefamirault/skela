class ExamsController < CruddyController

  # define any CRUD actions to override CruddyController


  def add_resource
    @exam = Exam.find params[:id]
    @resource = Resource.find_by_description params[:exam][:new_resource]
    @exam.resources << @resource
    redirect_to exams_path
  end

  def remove_resource
    @exam = Exam.find params[:id]
    @resource = Resource.find params[:resource_id]
    @exam.resources.delete @resource
    render nothing: true
  end

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
    params.require(:exam).permit(:topic, :description, :datetime, :location)
  end

end
