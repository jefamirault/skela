class AddInstructorEmailToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :instructor_email, :string
  end
end
