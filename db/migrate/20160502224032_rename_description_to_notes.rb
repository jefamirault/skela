class RenameDescriptionToNotes < ActiveRecord::Migration
  def change
    rename_column :assignments, :description, :notes
    rename_column :exams,       :description, :notes
  end
end
