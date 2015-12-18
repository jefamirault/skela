class AddContextToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :context_id, :integer
  end
end
