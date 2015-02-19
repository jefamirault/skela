class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @course.user = current_user
    @course.save
  end

  def update
    @course = Course.find params[:id]
    if @course.update(course_params)
      respond_to do |format|
        format.js
      end
    end
  end

  def edit
    @course = Course.find params[:id]
  end

  def show
  end

  def destroy
    @course = Course.find params[:id]
    if @course.destroy
      redirect_to courses_path, notice: 'Course deleted successfully.'
    end

  end

  def assignments
    @course = Course.find params[:id]
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :instructor, :assistant_instructor)
  end

end
