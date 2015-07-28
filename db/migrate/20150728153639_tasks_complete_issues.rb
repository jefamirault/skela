class TasksCompleteIssues < ActiveRecord::Migration
  def change
    %w(completed assignee_id tester_id tested_at completed_at assigned_at).each do |column|
      remove_column :issues, column
    end

    add_column :tasks, :assignee_id, :integer
  end
end
