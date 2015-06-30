class Player < ActiveRecord::Base
  belongs_to :world
  belongs_to :user
  has_many :outposts, foreign_key: 'founder_id'

  has_many :supporters, class_name: 'Player', foreign_key: 'leader_id'
  belongs_to :leader, class_name: 'Player'

  def world
    if super.nil?
      self.world = World.home
    end
    super
  end

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
    world.open_portals
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

  def open_portal(direction)
    if world.closed_portals.include? direction.to_sym
      new_world = World.create name: "#{self.name}'s Land"

      direction_string = direction.to_s
      case direction_string
        when 'north'
          world.portal_1_id = new_world.id
          new_world.portal_3_id = world.id
        when 'east'
          world.portal_2_id = new_world.id
          new_world.portal_4_id = world.id
        when 'south'
          world.portal_3_id = new_world.id
          new_world.portal_1_id = world.id
        when 'west'
          world.portal_4_id = new_world.id
          new_world.portal_2_id = world.id
      end
      world.save
      new_world.save
    self.mana -= 10
    end
    save
    new_world
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

  def to_s
    name
  end

  def set_influence(amount)
    self.influence = amount
    save
  end

  def to_s
    name
  end

  def create_outpost
    unless world.has_outpost?
      if self.influence >= 10
        self.influence -= 10
        outpost = Outpost.create
        outpost.founder = self
        outpost.world = world
        outpost.save
      end
    end
  end

  def give_support_to(player)
    self.leader = player
    save
  end

  def withdraw_support
    self.leader = nil
    save
  end

  def relinquish_supporters
    self.supporters.each do |supporter|
      self.supporters.delete supporter
    end
    save
  end
end
