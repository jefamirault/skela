class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.text :description
      t.date :due_date
      t.integer :course_id
    end
  end
end
