class Context < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  has_many :context_trackers
  has_many :trackers, through: :context_trackers

end
