class TasksController < ApplicationController

  before_filter :set_tasks, only: [:index, :destroy]
  before_filter :set_task, only: [:show, :edit, :update, :destroy]

  def index
    render 'cards/default'
  end

  def new
    @task = Task.create creator: current_user
    render 'cards/default'
  end

  def show
    render 'cards/default'
  end

  def edit
    render 'cards/default'
  end

  def update
    @task.update(task_params)
  end

  def destroy
    @task.destroy
    render 'cards/destroy'
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

  def default_render
    render 'cards/default'
  end

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
