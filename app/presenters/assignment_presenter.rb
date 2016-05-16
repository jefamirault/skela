class AssignmentPresenter
  include ActionView::Helpers
  include ActionView::Context

  def initialize(assignment = nil)
    @assignment = assignment
  end

  def title
    @assignment.title
  end

  def date
    @assignment.date ? @assignment.date.strftime('%a %-m/%-d') : nil
  end

  def notes
    @assignment.notes
  end

end
