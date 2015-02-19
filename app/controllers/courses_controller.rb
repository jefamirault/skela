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

  end

  def show
  end

  def destroy
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :instructor, :assistant_instructor)
  end

end
