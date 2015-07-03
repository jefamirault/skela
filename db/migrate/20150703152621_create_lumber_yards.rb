class CreateLumberYards < ActiveRecord::Migration
  def change
    create_table :lumber_yards do |t|
      t.integer :outpost_id
      t.integer :size

      t.timestamps null: false
    end
  end
end
