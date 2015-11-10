class CreatePoops < ActiveRecord::Migration
  def change
    create_table :poops do |t|
      t.datetime :time
      t.integer :rating
    end
  end
end
