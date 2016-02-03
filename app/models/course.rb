class Course < ActiveRecord::Base
  belongs_to :user
  has_many :assignments
  has_many :readings
  has_many :exams

  def to_s
    self.title
  end

  alias_attribute :number, :course_number

  def add_reading(reading)
    self.readings << reading
  end
  def add_assignment(assignment)
    self.assignments << assignment
  end
  def add_exam(exam)
    self.exams << exam
  end
end
