class CruddyController < ApplicationController

  before_filter :set_resource, only: [:show, :edit, :update, :destroy]
  before_filter :set_resources, only: :index
  before_filter :create_resource, only: :new


  def index
    render 'cruddy/index'
  end

  def new
    render 'cruddy/create'
  end

  def show
    render 'cruddy/read'
  end

  def edit
    render 'cruddy/read'
  end

  def update
    @resource.update crud_params
    render 'cruddy/update'
  end

  def destroy
    @resource.destroy
    render 'cruddy/destroy'
  end


  private

  def model
    eval params[:controller].singularize.titleize.gsub(' ','')
  end

  def model_formatted
    "@#{model}".downcase
  end

  def set_resource
    @resource = if params[:id]
      model.find params[:id]
    else
      nil
    end
    self.instance_variable_set model_formatted.to_sym, @resource
  end

  def set_resources
    @resources = model.all
    self.instance_variable_set model_formatted.pluralize.to_sym, @resources
  end

  def create_resource
    @resource = model.create
    self.instance_variable_set model_formatted.to_sym, @resource
  end

  def crud_params
    eval "#{model.to_s.singularize.underscore}_params"
  end

end
