class AddAvatarToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :integer, default: 0
  end
end
