module ResourcefulController
  extend ActiveSupport::Concern

  included do
    def add_resource
      @resourceful = resourceful.find params[:id]
      input = params[resourceful_name.to_sym][:new_resource]
      @resource = Resource.where(title: input).first
      if @resource.nil?
        def input.looks_like_a_url?
          self[0..6] == 'http://'
        end
        @resource = if input.looks_like_a_url?
                      Resource.create url: input, title: input[7..-1], course: current_course
                    else
                      Resource.create title: input, course: current_course
                    end
      end
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
