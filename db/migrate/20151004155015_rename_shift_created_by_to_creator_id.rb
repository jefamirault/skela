class RenameShiftCreatedByToCreatorId < ActiveRecord::Migration
  def change
    rename_column :shifts, :created_by, :creator_id
  end
end
