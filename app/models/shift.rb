class Shift < ActiveRecord::Base
  belongs_to :user
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  has_many :tasks, as: :taskable

  def title
    "#{start.strftime '%A'} Shift"
  end
end
