class RemoveInventories < ActiveRecord::Migration
  def change
    drop_table :inventories
    drop_table :items
    drop_table :stocks
  end
end
