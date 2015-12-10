class AddContextsToSounds < ActiveRecord::Migration
  def change
    add_column :sounds, :context_id, :integer
  end
end
