class RemoveItemIdFromInventories < ActiveRecord::Migration
  def change
    remove_column :inventories, :item_id
  end
end
