class Exam < ActiveRecord::Base
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
    self.datetime ? self.datetime.to_date : nil
  end
end
