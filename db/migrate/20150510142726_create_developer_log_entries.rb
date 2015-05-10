class CreateDeveloperLogEntries < ActiveRecord::Migration
  def change
    create_table :developer_log_entries do |t|
      t.string :title
      t.text :text
      t.datetime :datetime
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
