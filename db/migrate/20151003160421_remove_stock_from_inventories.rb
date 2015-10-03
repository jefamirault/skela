class RemoveStockFromInventories < ActiveRecord::Migration
  def change
    remove_column :inventories, :stock
  end
end
