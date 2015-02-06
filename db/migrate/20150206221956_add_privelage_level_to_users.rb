class AddPrivelageLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :privelage_level, :integer
  end
end
