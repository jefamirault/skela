class AddContextToItems < ActiveRecord::Migration
  def change
    add_column :items, :context_id, :integer
  end
end
