class CreateOutposts < ActiveRecord::Migration
  def change
    create_table :outposts do |t|
      t.integer :world_id
      t.integer :founder_id

      t.timestamps null: false
    end
  end
end
