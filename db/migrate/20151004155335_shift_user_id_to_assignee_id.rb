class ShiftUserIdToAssigneeId < ActiveRecord::Migration
  def change
    rename_column :shifts, :user_id, :assignee_id
  end
end
