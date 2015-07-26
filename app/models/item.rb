class Item < ActiveRecord::Base


  def name

    read_attribute(:name) || 'New Item'
  end
end
