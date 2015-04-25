class CreatePlaneOfWorldsProfiles < ActiveRecord::Migration
  def change
    create_table :plane_of_worlds_profiles do |t|
      t.string :alias
      t.integer :current_world_id
      t.integer :portal_points
    end
  end
end
