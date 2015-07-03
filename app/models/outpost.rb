class Outpost < ActiveRecord::Base
  belongs_to :world
  belongs_to :founder, class_name: 'Player'
  has_one :forum
  has_one :tower
  has_one :lumber_yard

  def self.influence_cost
    10
  end

  def has_forum?
    !!self.forum
  end

  def has_tower?
    !!self.tower
  end

  def has_lumber_yard?
    !!lumber_yard
  end
end
