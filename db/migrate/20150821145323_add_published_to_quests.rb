class AddPublishedToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :published, :boolean
  end
end
