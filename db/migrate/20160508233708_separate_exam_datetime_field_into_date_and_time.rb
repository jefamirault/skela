class SeparateExamDatetimeFieldIntoDateAndTime < ActiveRecord::Migration
  def change
    add_column :exams, :time, :time
    Exam.all.each do |exam|
      if exam.date
        exam.time = exam.date.to_time
        exam.save
      end
    end
    change_column :exams, :date, :date
  end
end
