class Item < ActiveRecord::Base
  has_many :stocks
  has_many :inventories, through: :stocks

  def name
    read_attribute(:name) || 'New Item'
  end
end
