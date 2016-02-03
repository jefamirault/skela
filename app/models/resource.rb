class Resource < ActiveRecord::Base
  has_many :resource_inclusions
  has_many :resourcefuls, through: :resource_inclusions
end
