module Resourceful
  extend ActiveSupport::Concern

  included do
    has_many :resource_inclusions, as: :resourceful
    has_many :resources, through: :resource_inclusions
    validates_presence_of :title
    attr_accessor :new_resource
  end


  def add_resource(resource)
    self.resources << resource
  end

  def add_resources(*resources)
    self.resources << resources
  end
end
