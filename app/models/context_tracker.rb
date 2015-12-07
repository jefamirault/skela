class ContextTracker < ActiveRecord::Base
  belongs_to :context
  belongs_to :tracker
end
