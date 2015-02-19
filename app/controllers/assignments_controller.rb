class AssignmentsController < ApplicationController
  def index
    @course = Course.find params[:course_id]
    @assignments = @course.assignments
  end

  def show
    @assignment = Assignment.find params[:id]
  end

  def new
    @course = Course.find params[:course_id]
    @assignment = Assignment.new
    @assignment.course = @course

    if @assignment.save
      respond_to do |format|
        format.html
      end
    end
  end

  def create
  end

  def edit
    @assignment = Assignment.find params[:id]
  end

  def update
    @assignment = Assignment.find params[:id]

    if @assignment.update(assignment_params)
      flash[:notice] = 'Assignment updated successfully!'
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @assignment = Assignment.find params[:id]
    if @assignment.destroy
      redirect_to assignments_path(@assignment.course), notice: 'Assignment successfully deleted'
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:title, :description, :deadline)
  end
end
