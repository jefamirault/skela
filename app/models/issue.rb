class Issue < ActiveRecord::Base
  belongs_to :context
  belongs_to :creator, class_name: 'User'
  # belongs_to :assignee, class_name: 'User'
  # belongs_to :tester, class_name: 'User'

  # before_update :update_tested_at, if: :tester_id_changed?
  # before_update :update_completed_at, if: :completed_changed?
  # before_update :updated_assigned_at, if: :assignee_id_changed?


  has_one :task, as: :taskable, dependent: :destroy

  attr_accessor :task_id


  def self.incomplete
    Issue.all.select do |issue|
      issue.status != 'Complete'
    end
  end

  def self.complete
    Issue.all.select do |issue|
      issue.status == 'Complete'
    end
  end

  def number(options = {})
    include_number_sign = !options[:plain]
    issue_number_length = 4
    "#{ '#' if include_number_sign }#{self.id.to_s.rjust(issue_number_length, '0')}"
  end

  def mark_complete
    case tasks.size
      when 0
        task = Task.create complete: true
        self.tasks << task
      when 1
        tasks.first.mark_incomplete
      when 2
        raise 'SHIT I DIDN\'T CODE THAT PART YET'
    end
  end

  def mark_incomplete
    case tasks.size
      when 0
        task = Task.create
        self.tasks << task
      when 1
        tasks.first.mark_incomplete
      when 2
        raise 'SHIT I DIDN\'T CODE THAT PART YET'
    end
  end

  def status
    if task
      task.complete ? 'Complete' : 'Incomplete'
    else
      'Incomplete'
    end
  end

  def assign_to(user)
    case tasks.size
      when 0
        task = Task.create assignee: user
        self.tasks << task
      when 1
        tasks.first.assign_to user
      when 2
        raise 'SHIT I DIDN\'T CODE THAT PART YET'
    end
  end

  def assignee
    case tasks.size
      when 0
        'Unassigned'
      when 1
        tasks.first.assignee
      else
        raise 'SHIT I DIDN\'T CODE THAT PART YET'
    end
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
