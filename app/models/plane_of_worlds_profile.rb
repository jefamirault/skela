class PlaneOfWorldsProfile < ActiveRecord::Base
  has_one current_world, class: 'World', foreign_key: 'current_world_id'

end
