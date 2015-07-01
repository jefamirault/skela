class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :forum_id
      t.string :title

      t.timestamps null: false
    end
  end
end
