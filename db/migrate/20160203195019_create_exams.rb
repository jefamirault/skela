class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.integer :course_id
      t.string :topic
      t.text :description
      t.datetime :datetime
      t.string :location
    end
  end
end
