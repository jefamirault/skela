class RenameDeveloperLogEntriesToLogEntries < ActiveRecord::Migration
  def change
    rename_table :developer_log_entries, :log_entries
  end
end
