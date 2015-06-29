class Portal < ActiveRecord::Base
  belongs_to :origin_world, class_name: 'World'
  belongs_to :destination_world, class_name: 'World'

  def worlds
    [origin_world.name, destination_world.name]
  end

  def self.cost
    10
  end

  def self.exists_between(world1, world2)
    world1.open_portals.each do |direction|
      if world1.to_the(direction) == world2
        return true
      end
    end
    false
  end
end
