class ItemsController < ApplicationController

  def index
    @items = current_user.items
    render 'cards/index'
  end

  def edit
    @item = Item.find params[:id]
    render 'cards/edit'
  end

  def new
    @item = Item.create creator: current_user
    render 'cards/new'
  end

  def update
    @item = Item.find params[:id]
    @item.update(item_params)
    render nothing: true
  end

  def destroy
    @item = Item.find params[:id]

    @item.destroy

    @items = Item.all
    render 'cards/index'
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
