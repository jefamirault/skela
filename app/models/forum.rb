class Forum < ActiveRecord::Base
  belongs_to :outpost
  has_many :conversations
  has_many :posts, through: :conversations
  belongs_to :founder, class_name: 'Player'

end
