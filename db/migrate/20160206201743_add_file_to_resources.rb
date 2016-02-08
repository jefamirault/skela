class AddFileToResources < ActiveRecord::Migration
  def change
    add_column :resources, :filename, :string
    add_column :resources, :content_type, :string
    add_column :resources, :file_contents, :binary
  end
end