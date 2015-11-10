class IssuesController < CruddyController
  before_filter :authenticate, except: [:index, :show]

  def index
    @resources = if params[:complete] == 'hidden'
      Issue.incomplete
    else
      Issue.all
    end
    render 'cruddy/index'
  end

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

  def new_task
    @issue = Issue.find params[:issue_id]
    @task = Task.create
    @issue.tasks << @task
  end

  def add_task
    @issue = Issue.find params[:issue_id]
    task_id_or_subject = params[:issue][:task_id]

    @task = if task_id_or_subject.class == Fixnum
      Task.find task_id_or_subject
    else # string
      task = Task.find_by_subject task_id_or_subject
      if task.nil?
        task = Task.new subject: task_id_or_subject
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:subject, :description, :how_to_test, :completed, :assignee_id, :tester_id, :category,
                                  :target_version, :created_at, :updated_at, :completed_at, :tested_at, :assigned_at)
  end

end
