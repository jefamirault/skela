class Issue < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  belongs_to :assignee, class_name: 'User'
  belongs_to :tester, class_name: 'User'

  before_update :update_tested_at, if: :tester_id_changed?
  before_update :update_completed_at, if: :completed_changed?
  before_update :updated_assigned_at, if: :assignee_id_changed?

  def number(options = {})
    include_number_sign = !options[:plain]
    issue_number_length = 4
    "#{ '#' if include_number_sign }#{self.id.to_s.rjust(issue_number_length, '0')}"
  end

  private

  def update_tested_at
    if self.tester.blank?
      self.tested_at = nil
    else
      self.tested_at = Time.now
    end
  end
  def update_completed_at
    if self.completed?
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
  end
  def updated_assigned_at
    if self.assignee
      self.assigned_at = Time.now
    else
      self.assigned_at = nil
    end
  end
end
