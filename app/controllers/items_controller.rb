class ItemsController < CruddyController

  def update
    @item = Item.find params[:id]
    @item.update(item_params)
  end

  def autocomplete
    query = Item.ransack(name_cont: params[:data]).result
    @suggestions = query.map do |item|
      { label: item.name, value: item.name }
    end.to_json

    respond_to do |format|
      format.json { render json: @suggestions }
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :units, :description)
  end

end
