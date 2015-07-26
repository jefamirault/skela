class Stock < ActiveRecord::Base
  belongs_to :item
  belongs_to :inventory

end
