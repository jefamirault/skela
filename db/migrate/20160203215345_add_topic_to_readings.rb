class AddTopicToReadings < ActiveRecord::Migration
  def change
    add_column :readings, :topic, :string
  end
end
