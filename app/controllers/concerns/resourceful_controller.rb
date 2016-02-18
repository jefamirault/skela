module ResourcefulController
  extend ActiveSupport::Concern

  included do
    def add_resource
      @resourceful = resourceful.find params[:id]
      @resource = Resource.find_by_description params[resourceful_name.to_sym][:new_resource]
      @resourceful.resources << @resource
      render 'resources/add_resource'
    end

    def remove_resource
      @resourceful = resourceful.find params[:id]
      @resource = Resource.find params[:resource_id]
      @resourceful.resources.delete @resource
      render nothing: true
    end
  end

  private

  def resourceful_name
    self.class.to_s[0..-11].singularize.underscore
  end

  def resourceful
    resourceful_name.singularize.classify.constantize
  end

end
