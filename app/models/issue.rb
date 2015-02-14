class Issue < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :tester, class_name: 'User'

  def number(options = {})
    include_number_sign = !options[:plain]
    issue_number_length = 4
    "#{ '#' if include_number_sign }#{self.id.to_s.rjust(issue_number_length, '0')}"
  end
end
