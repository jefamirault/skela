class CoursePresenter
  include ActionView::Helpers
  include ActionView::Context

  def initialize(course = nil)
    @course = course
  end

  def title
    @course.title
  end

  def instructor
    @course.instructor
  end

  def instructor_email
    @course.instructor_email
  end

  def schedule
    @course.schedule
  end

  def location
    @course.location
  end

end
