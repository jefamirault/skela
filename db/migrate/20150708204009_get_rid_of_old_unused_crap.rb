class GetRidOfOldUnusedCrap < ActiveRecord::Migration
  def change
    drop_table :portals
  end
end
