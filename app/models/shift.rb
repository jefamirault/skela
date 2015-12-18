class Shift < ActiveRecord::Base
  belongs_to :context
  belongs_to :assignee, class_name: 'User', foreign_key: :assignee_id
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  has_many :tasks, as: :taskable

  # validate :shift_starts_and_ends_same_day
  validate :start_time_is_before_end_time

  def title
    date ? "#{date.strftime '%A'} Shift" : 'New Shift'
  end

  def date
    start_time ? start_time.to_date : nil
  end

  def start_time
    super ? super.to_time : nil
  end

  def end_time
    super ? super.to_time : nil
  end

  def start
    start_time
  end
  def end
    end_time
  end

  private

  def shift_starts_and_ends_same_day
    if start_time && end_time && start_time.to_date != end_time.to_date
      errors[:base] << 'Shift must start and end on the same day'
    end
  end

  def start_time_is_before_end_time

  end
end
