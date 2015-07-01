class CreateTowers < ActiveRecord::Migration
  def change
    create_table :towers do |t|
      t.integer :outpost_id
      t.integer :size

      t.timestamps null: false
    end
  end
end
