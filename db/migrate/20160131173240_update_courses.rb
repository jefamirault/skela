class UpdateCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :assistant_instructor, :string
    remove_column :courses, :description, :text
    add_column :courses, :course_number, :string
    add_column :courses, :schedule, :string
    add_column :courses, :location, :string
  end
end
