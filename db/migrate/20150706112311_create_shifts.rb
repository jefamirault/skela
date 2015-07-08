class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
