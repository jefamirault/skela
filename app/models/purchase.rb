class Purchase < ActiveRecord::Base
  belongs_to :user


  def remove_link
    self.purchase_link = nil
    self.save
  end
end
