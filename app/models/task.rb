class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  belongs_to :assignee, class_name: 'User'
  belongs_to :creator, class_name: 'User'

  def self.public
    Task.where(creator_id: nil)
  end

  def assignee
    super.nil? ? 'Unassigned' : super
  end

  def status
    self.complete ? 'Complete' : 'Incomplete'
  end

  def assign_to(user)
    self.assignee = user
    save
  end

  def mark_incomplete
    self.complete = false
    save
  end

  def mark_complete
    self.complete = true
    save
  end
end
