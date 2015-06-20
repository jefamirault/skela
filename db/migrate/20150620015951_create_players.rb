class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :user_id
      t.integer :world_id
      t.integer :mana
    end
  end
end
