class Task < ActiveRecord::Base
  belongs_to :taskable, polymorphic: true
  belongs_to :assignee, class_name: 'User'

  def assignee
    super.nil? ? 'Unassigned' : super
  end

end
