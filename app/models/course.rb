class Course < ActiveRecord::Base
  belongs_to :user
  has_many :assignments

  def to_s
    self.title
  end
end
