class TasksController < ApplicationController

  before_filter :set_tasks

  before_filter :set_task, only: [:show, :edit, :update, :destroy]


  def index
    render 'shared/index'
  end

  def new
    @task = Task.create
    render 'shared/new'
  end

  def show
    render 'shared/show'
  end

  def edit
    render 'shared/edit'
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
    render 'shared/destroy'
  end

  def autocomplete
    query = Task.ransack(title_cont: params[:data]).result
    @suggestions = query.map do |task|
      { label: task.title, value: task.title }
    end.to_json

    respond_to do |format|
      format.json { render json: @suggestions }
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = Task.all
  end

  def task_params
    params.require(:task).permit(:subject, :notes, :complete)
  end
end
