class Portal < ActiveRecord::Base
  belongs_to :origin_world, class_name: 'World'
  belongs_to :destination_world, class_name: 'World'

  def worlds
    [origin_world.name, destination_world.name]
  end

end
