class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :title
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
