class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.integer :user_id
      t.integer :face
      t.integer :head
      t.integer :color
    end

    remove_column :users, :avatar
  end
end
