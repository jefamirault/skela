class IssuesController < ApplicationController
  before_filter :authenticate, except: [:index, :show]
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  def index
    @issues = Issue.all

    render 'shared/index'
  end

  # GET /issues/1
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new(creator: current_user)
    respond_to do |format|
      if @issue.save
        format.js
      end
    end
  end

  # GET /issues/1/edit
  def edit
    render 'shared/edit'
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)
    @issue.creator = current_user
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue created successfully!' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to edit_issue_path(@issue), notice: 'Issue updated successfully!' }
        flash[:notice] = 'Issue updated successfully'
        format.js { }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  def destroy
    @issues = Issue.all
    if @issue.destroy
      # redirect_to issues_path
      # return
    end
    respond_to do |format|
      # format.html { redirect_to issues_url, notice: 'Issue destroyed successfully!' }
      format.js
    end
  end

  def add_task
    @issue = Issue.find params[:issue_id]
    task_id_or_title = params[:issue][:task_id]

    @task = if task_id_or_title.class == Fixnum
      Task.find task_id_or_title
    else # string
      task = Task.find_by_title task_id_or_title
      if task.nil?
        task = Task.new title: task_id_or_title
        task.save
      end
      task
    end

    @issue.tasks << @task
  end

  def remove_task
    @issue = Issue.find params[:issue_id]
    @task = Task.find params[:task_id]

    @issue.tasks.delete @task
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id]) rescue redirect_to(issues_path)

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:subject, :description, :how_to_test, :completed, :assignee_id, :tester_id, :category,
                                    :target_version, :created_at, :updated_at, :completed_at, :tested_at, :assigned_at)
    end
end
