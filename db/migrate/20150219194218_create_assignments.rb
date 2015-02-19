class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :course_id
      t.string :title
      t.text :description
      t.datetime :deadline
    end
  end
end
