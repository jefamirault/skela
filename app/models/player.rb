class Player < ActiveRecord::Base
  belongs_to :world

  def add_mana(amount)
    if mana
      self.mana += amount
    else
      self.mana = amount
    end
  end

  def set_location(place)
    self.world = place
    save
  end

  def nearby_portals
    world.active_portals
  end

  def open_portal_to(other_world)
    return false if world.open_portals.empty? ||  other_world.open_portals.empty?

    first_portal_space = if world.open_portals.include? :north
      1
    elsif world.open_portals.include? :east
      2
    elsif world.open_portals.include? :south
      3
    elsif world.open_portals.include? :west
      4
    end

    second_portal_space = if other_world.open_portals.include? :north
      1
    elsif other_world.open_portals.include? :east
      2
    elsif other_world.open_portals.include? :south
      3
    elsif other_world.open_portals.include? :west
      4
    end

    world.send("portal_#{first_portal_space}_id=", other_world.id)
    other_world.send("portal_#{second_portal_space}_id=", world.id)

    world.save
    other_world.save
  end

  def take_portal_to(other_world)
    [:north, :east, :south, :west].each do |direction|
      if world.to_the(direction) == other_world
        set_location other_world
        return
      end
    end
    false
  end
end
