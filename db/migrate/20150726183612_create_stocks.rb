class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :inventory_id
      t.integer :item_id
      t.float :quantity
      t.string :units

      t.timestamps null: false
    end
  end
end
