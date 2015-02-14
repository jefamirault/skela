class SpellPrivilegeCorrectly < ActiveRecord::Migration
  def self.up
    rename_column :users, :privelage_level, :privilege_level
  end

  def self.down
    rename_column :users, :privilege_level, :privelage_level
  end
end
