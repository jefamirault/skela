class ChangePrimaryFieldNamesToTitle < ActiveRecord::Migration
  def change
    rename_column :readings, :description, :title
    rename_column :exams, :topic, :title
  end
end
