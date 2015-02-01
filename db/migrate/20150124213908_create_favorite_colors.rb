class CreateFavoriteColors < ActiveRecord::Migration
  def change
    create_table :favorite_colors do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
