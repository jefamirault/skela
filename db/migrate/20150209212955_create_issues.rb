class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description
      t.text :how_to_test

      t.timestamps null: false
    end
  end
end
