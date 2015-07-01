class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :conversation_id
      t.text :content
      t.integer :poster_id
      t.integer :parent_post_id

      t.timestamps null: false
    end
  end
end
