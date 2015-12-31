class Tracker < ActiveRecord::Base
  has_many :context_trackers
  has_many :contexts, through: :context_trackers

  def path
    Rails.application.routes.url_helpers.send "#{name.underscore}_path"
  end

  def to_s
    self.name
  end
end
