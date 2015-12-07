class CreateContextTrackers < ActiveRecord::Migration
  def change
    create_table :context_trackers do |t|
      t.integer :context_id
      t.integer :tracker_id
      t.integer :data
    end
  end
end
