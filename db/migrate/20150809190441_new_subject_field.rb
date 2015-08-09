class NewSubjectField < ActiveRecord::Migration
  def change
    rename_column :issues, :title, :subject

    rename_column :tasks, :title, :subject
    add_column :tasks, :notes, :string
  end
end
