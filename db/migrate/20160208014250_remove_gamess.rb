class RemoveGamess < ActiveRecord::Migration
  def change
    drop_table :quests
    drop_table :challenges
  end
end
