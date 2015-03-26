class IssueMetadata < ActiveRecord::Migration
  def change
    add_column :issues, :tested_at, :datetime
    add_column :issues, :completed_at, :datetime
    add_column :issues, :assigned_at, :datetime
    add_column :issues, :target_version, :string
  end
end
