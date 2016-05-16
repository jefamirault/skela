class ResourcePresenter
  include ActionView::Helpers
  include ActionView::Context

  def initialize(resource = nil)
    @resource = resource
  end

  def title
    @resource.title
  end

  def url
    @resource.url
  end

  def notes
    @resource.notes
  end

end
