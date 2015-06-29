class Outpost < ActiveRecord::Base
  belongs_to :world
  belongs_to :founder, class_name: 'Player'

end
