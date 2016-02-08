class RemovePlaneOfWorldsProfiles < ActiveRecord::Migration
  def change
    drop_table :plane_of_worlds_profiles
  end
end
