class AddContextToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :context_id, :integer
  end
end
