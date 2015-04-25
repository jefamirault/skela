class World < ActiveRecord::Base
  has_many :portals, foreign_key: :origin_world_id
  has_many :origin_worlds, :through => :portals
  
  has_many :inverse_portals, :class_name => 'Portal', :foreign_key => :destination_world_id
  has_many :destination_worlds, :through => :inverse_portals, :source => :origin_world

  # class: user
  # has_many :friendships
  # has_many :friends, :through => :friendships
  # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  # has_many :inverse_friends, :through => :inverse_friendships, :source => :user
end
