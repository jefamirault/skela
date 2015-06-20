class AddPortalsToWorlds < ActiveRecord::Migration
  def change
    add_column :worlds, :portal_1_id, :integer
    add_column :worlds, :portal_2_id, :integer
    add_column :worlds, :portal_3_id, :integer
    add_column :worlds, :portal_4_id, :integer
  end
end
