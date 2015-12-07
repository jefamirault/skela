class TasksController < CruddyController

  # define any CRUD actions to override CruddyController

  def new

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

  def task_params
    params.require(:task).permit(:subject, :notes, :complete, :assignee_id)
   end

end
