class Inventory < ActiveRecord::Base
  has_many :stocks
  has_many :items, through: :stocks

  def track_item(item)
    unless items.include? item
      stock = Stock.new
      stock.inventory = self
      stock.item = item
      return stock.save
    end
    true
  end

  def remove_item(item)
    if items.include? item
      return items.delete item
    end
    true
  end
end
