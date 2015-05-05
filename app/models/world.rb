class World < ActiveRecord::Base
  has_many :portals, foreign_key: :origin_world_id
  has_many :origin_worlds, :through => :portals
  has_many :inverse_portals, :class_name => 'Portal', :foreign_key => :destination_world_id
  has_many :destination_worlds, :through => :inverse_portals, :source => :origin_world

  def adjacent_worlds
    origin_worlds + destination_worlds
  end

  def rename(name)
    self.name = name
    self.save
  end
end
