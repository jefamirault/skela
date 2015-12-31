class Context < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  has_many :context_trackers
  has_many :trackers, through: :context_trackers

  def first_tracker
    if trackers.present?
      trackers.first
    else
      nil
    end
  end

end
