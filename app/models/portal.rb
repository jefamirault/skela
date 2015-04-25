class Portal < ActiveRecord::Base
  belongs_to :origin_world, class_name: 'World'
  # belongs_to :destination_world, class_name: 'World'

  def worlds
    [first_world, second_world]
  end

end
