class AddIconToContexts < ActiveRecord::Migration
  def change
    add_column :contexts, :icon, :string
  end
end
