class RemovePlaneOfWorlds < ActiveRecord::Migration
  def change
    drop_table :worlds
    drop_table :towers
    drop_table :posts
    drop_table :players
    drop_table :outposts
    drop_table :lumber_yards
    drop_table :forums
    drop_table :conversations
  end
end
