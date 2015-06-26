class AddInfluenceToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :influence, :integer
  end
end
