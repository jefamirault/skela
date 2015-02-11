class IssuesUpgrade < ActiveRecord::Migration
  def change
    add_column :issues, :completed, :boolean
    add_column :issues, :creator_id, :integer
    add_column :issues, :assignee_id, :integer
    add_column :issues, :tester_id, :integer
  end
end
