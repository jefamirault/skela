class LogEntriesController < CruddyController

  # define any CRUD actions to override CruddyController

  def new
    @resource.user = current_user
    @resource.datetime = Time.now
    @resource.save
    render 'cruddy/create'
  end

  private

  def log_entry_params
    params.require(:log_entry).permit(:title, :text)
  end

end
