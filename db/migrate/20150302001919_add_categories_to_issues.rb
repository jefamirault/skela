class AddCategoriesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :category, :string
  end
end
