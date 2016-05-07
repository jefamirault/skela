class RenameDatesToDate < ActiveRecord::Migration
  def change
    rename_column :assignments, :due_date, :date
    rename_column :exams, :datetime, :date
    rename_column :readings, :due_date, :date
  end
end
