class TasksController < ApplicationController

  before_filter :set_tasks
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if request.format == :html
      render 'cards/index'
    end
  end

  def new
    @task = Task.create creator: current_user
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
    @task = Task.find(params[:id])
  end

  def set_tasks
    @tasks = current_user.tasks
  end

  def task_params
    params.require(:task).permit(:subject, :notes, :complete, :assignee_id)
  end
end
