class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :end
      t.integer :user_id
      t.integer :created_by

      t.timestamps null: false
    end
  end
end
