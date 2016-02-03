class AssignmentDueDateInsteadOfDeadline < ActiveRecord::Migration
  def change
    rename_column :assignments, :deadline, :due_date
    change_column :assignments, :due_date, :date
  end
end
