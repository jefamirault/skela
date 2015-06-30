class AddLeaderIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :leader_id, :integer
  end
end
