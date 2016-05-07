class RenameResourceDescriptionToTitle < ActiveRecord::Migration
  def change
    rename_column :resources, :description, :title
  end
end
