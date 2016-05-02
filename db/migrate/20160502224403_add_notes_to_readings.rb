class AddNotesToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :notes, :text
  end
end
