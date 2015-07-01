class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.integer :outpost_id
      t.integer :founder_id

      t.timestamps null: false
    end
  end
end
