class SoundsController < CruddyController

  # define any CRUD actions to override CruddyController

  def update
    @sound.update sound_params
    # TODO not sure why can't get to recognize ajax request
    redirect_to sounds_path
  end

  def show
    if request.xhr?
      render 'cruddy/read'
    else
      set_resource
      send_data(@sound.file_contents,
          type: @sound.content_type,
          filename: @sound.filename)
    end

  end

  private

  def sound_params
    params.require(:sound).permit(:title, :file)
  end

end
