class ExamPresenter
  include ActionView::Helpers
  include ActionView::Context

  def initialize(exam = nil)
    @exam = exam
  end

  def date
    @exam.date ? @exam.date.strftime('%a %-m/%-d') : nil
  end

  def time(option = :long)
    format = '%-l:%M'
    format << ' %p' unless option == :short
    @exam.time ? @exam.time.strftime(format) : nil
  end

  def date_and_time
    if @exam.time
      "#{date} @#{time :short}"
    else
      date
    end
  end

  def location
    @exam.location
  end

  def notes
    @exam.notes
  end

end
