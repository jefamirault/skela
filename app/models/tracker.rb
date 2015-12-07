class Tracker < ActiveRecord::Base
  has_many :context_trackers
  has_many :contexts, through: :context_trackers
end
