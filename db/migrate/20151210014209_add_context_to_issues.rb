class AddContextToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :context_id, :integer
  end
end
