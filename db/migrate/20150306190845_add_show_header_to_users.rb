class AddShowHeaderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :show_header, :boolean, default: true
  end
end
