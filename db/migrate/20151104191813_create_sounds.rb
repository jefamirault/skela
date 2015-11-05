class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :title
      t.string :filename
      t.string :content_type
      t.binary :file_contents
    end
  end
end
