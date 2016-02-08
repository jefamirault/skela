class RemoveTrackers < ActiveRecord::Migration
  def change
    drop_table :trackers
    drop_table :context_trackers
    drop_table :contexts
  end
end
