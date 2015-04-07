class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.string :title
      t.string :need
      t.float :cost
      t.datetime :purchased_at
      t.text :purchase_link
    end
  end
end
