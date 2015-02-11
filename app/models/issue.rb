class Issue < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :tester, class_name: 'User'

  def number
    self.id.to_s.rjust 4, '0'
  end
end
