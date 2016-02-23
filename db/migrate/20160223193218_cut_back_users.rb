class CutBackUsers < ActiveRecord::Migration
  def change
    remove_column :users, :favorite_color, :string
    remove_column :users, :privilege_level, :integer
    add_column :users, :admin, :boolean
  end
end
