class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :text
      t.string :answer
      t.integer :quest_id

      t.timestamps null: false
    end
  end
end
