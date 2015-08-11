class TasksController < ApplicationController

  before_filter :set_tasks

  before_filter :set_task, only: [:show, :edit, :update, :destroy]


  def index
    if request.format == :html
      render 'cards/index'
    end
  end

  def new
    @task = Task.create
    render 'cards/new'
  end

  def show
    render 'cards/show'
  end

  def edit
    if request.format == :html
      render 'cards/edit'
    end
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
    @tasks = Task.all
    render 'index'
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
