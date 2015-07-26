class ItemsController < ApplicationController

  def index
    @items = Item.all
    render 'shared/index'
  end

  def edit
    @item = Item.find params[:id]
    render 'shared/edit'
  end

  def new
    @item = Item.create
    render 'shared/new'
  end


  def update
    @item = Item.find params[:id]

    @item.update(item_params)
    render 'shared/update'
  end

  def destroy
    @item = Item.find params[:id]

    @item.destroy

    @items = Item.all
    render 'shared/index'
  end

  private

  def item_params
    params.require(:item).permit(:name, :description)
  end
end
