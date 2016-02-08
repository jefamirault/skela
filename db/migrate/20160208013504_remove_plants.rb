class RemovePlants < ActiveRecord::Migration
  def change
    drop_table :plants
  end
end
