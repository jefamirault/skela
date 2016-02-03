class ResourceInclusion < ActiveRecord::Base
  belongs_to :resource
  belongs_to :resourceful, polymorphic: true
end