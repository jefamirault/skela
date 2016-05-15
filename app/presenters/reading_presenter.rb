class ReadingPresenter
  include ActionView::Helpers
  include ActionView::Context

  def initialize(reading = nil)
    @reading = reading
  end

  def date
    @reading.date ? @reading.date.strftime('%a %-m/%-d') : nil
  end

  def notes
    @reading.notes
  end

end
