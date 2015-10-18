class TasksController < ApplicationController

  before_filter :set_tasks, only: [:index, :destroy]
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  def index
    render 'cruddy/index'
  end

  def new
    @resource = Task.create creator: current_user
    render 'cruddy/create'
  end

  def show
    render 'cruddy/read'
  end

  def edit
    render 'cruddy/read'
  end

  def update
    @resource.update task_params
  end

  def destroy
    @resource.destroy
    render 'cruddy/destroy'
  end

  def autocomplete
    query = Task.ransack(subject_cont: params[:data]).result
    @suggestions = query.map do |task|
      { label: task.subject, value: task.subject}
    end.to_json

    respond_to do |format|
      format.json { render json: @suggestions }
    end
  end

  private

  def set_task
    @resource = Task.find(params[:id])
  end

  def set_tasks
    @resources = if logged_in?
      current_user.tasks
    else
      Task.public
    end
  end

  def task_params
    params.require(:task).permit(:subject, :notes, :complete, :assignee_id)
  end
end
