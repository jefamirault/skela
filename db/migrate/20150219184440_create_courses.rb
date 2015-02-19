class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :instructor
      t.string :assistant_instructor
    end
  end
end
