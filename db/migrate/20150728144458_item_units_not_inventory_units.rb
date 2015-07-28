class ItemUnitsNotInventoryUnits < ActiveRecord::Migration
  def change
    add_column :items, :units, :string
    remove_column :stocks, :units
  end
end
