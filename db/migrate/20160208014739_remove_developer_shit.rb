class RemoveDeveloperShit < ActiveRecord::Migration
  def change
    drop_table :log_entries
    drop_table :issues
    drop_table :tasks
    drop_table :shifts
  end
end
