class Reading < ActiveRecord::Base
  include Resourceful

  belongs_to :course

end
