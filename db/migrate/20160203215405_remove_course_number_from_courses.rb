class RemoveCourseNumberFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :course_number, :string
  end
end
