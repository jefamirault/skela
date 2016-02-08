class Exam < ActiveRecord::Base
  include Resourceful

  belongs_to :course
end
