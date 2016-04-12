class Reading < ActiveRecord::Base
  include Resourceful

  belongs_to :course

  def new_resource=(resource)
    self.resources << resource
    save
  end
  def new_resource
    nil
  end

  def date
    self.due_date
  end
end
