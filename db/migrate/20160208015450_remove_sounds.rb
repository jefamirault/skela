class RemoveSounds < ActiveRecord::Migration
  def change
    drop_table :sounds
    drop_table :songs
  end
end
