class Inventory < ActiveRecord::Base
  has_many :stocks
  has_many :items, through: :stocks

  accepts_nested_attributes_for :stocks

  attr_accessor :item_id

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

  def update_stock(item, quantity)
    stock = Stock.where(inventory_id: self.id, item_id: item.id).first
    stock.quantity = quantity
    stock.save
  end
end
