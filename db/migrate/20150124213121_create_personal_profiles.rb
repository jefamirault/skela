class CreatePersonalProfiles < ActiveRecord::Migration
  def change
    create_table :personal_profiles do |t|
      t.string :name
      t.integer :favorite_color_id

      t.timestamps null: false
    end
  end
end
