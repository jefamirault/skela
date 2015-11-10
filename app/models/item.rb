class Item < ActiveRecord::Base
  has_many :stocks, dependent: :destroy
  has_many :inventories, through: :stocks
  belongs_to :creator, class_name: 'User'

  def name
    read_attribute(:name) || 'New Item'
  end
end
