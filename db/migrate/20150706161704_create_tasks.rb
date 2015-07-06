class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.boolean :complete
      t.string :title
      t.integer :taskable_id
      t.string :taskable_type

      t.timestamps null: false
    end
  end
end
