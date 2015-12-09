class AddContextToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :context_id, :integer
  end
end
