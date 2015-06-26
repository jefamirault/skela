class World < ActiveRecord::Base
  has_many :portals, foreign_key: :origin_world_id
  has_many :origin_worlds, :through => :portals
  has_many :inverse_portals, :class_name => 'Portal', :foreign_key => :destination_world_id
  has_many :destination_worlds, :through => :inverse_portals, :source => :origin_world
  has_many :players



  def adjacent_worlds
    origin_worlds + destination_worlds
  end

  def rename(name)
    self.name = name
    self.save
  end

  def open_portals
    portals = []
    portals << :north if portal_1_id.nil?
    portals << :east  if portal_2_id.nil?
    portals << :south if portal_3_id.nil?
    portals << :west  if portal_4_id.nil?
    portals
  end

  def active_portals
    portals = []
    portals << :north unless portal_1_id.nil?
    portals << :east  unless portal_2_id.nil?
    portals << :south unless portal_3_id.nil?
    portals << :west  unless portal_4_id.nil?
    portals
  end

  def to_the_north
    if active_portals.include? :north
      World.find portal_1_id
    end
  end
  def to_the_east
    if active_portals.include? :east
      World.find portal_2_id
    end
  end
  def to_the_south
    if active_portals.include? :south
      World.find portal_3_id
    end
  end
  def to_the_west
    if active_portals.include? :west
      World.find portal_4_id
    end
  end
  def to_the(direction)
    case direction
      when :north
        to_the_north
      when :east
        to_the_east
      when :south
        to_the_south
      when :west
        to_the_west
    end
  end

  def self.home
    home = World.first
    if home.nil?
      home = World.new name: 'Home'
      home.save
    end
    home
  end

  def portal_open?(direction)
    active_portals.include? direction
  end
end
