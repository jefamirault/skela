class AddContextToLogEntries < ActiveRecord::Migration
  def change
    add_column :log_entries, :context_id, :integer
  end
end
