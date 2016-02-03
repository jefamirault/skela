class CreateResourceInclusions < ActiveRecord::Migration
  def change
    create_table :resource_inclusions do |t|
      t.integer :resource_id
      t.integer :resourceful_id
      t.string :resourceful_type
    end
  end
end
