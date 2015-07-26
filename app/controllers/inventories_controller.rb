class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all

    render 'shared/index'
  end

  def new
    @inventory = Inventory.create
    render 'shared/new'
  end

  def edit
    @inventory = Inventory.find params[:id]
    render 'shared/edit'
  end

  def show
    @inventory = Inventory.find params[:id]

    render 'shared/edit'
  end

  def update
    @inventory = Inventory.find params[:id]
    @inventory.update inventory_params
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    @inventories = Inventory.all
    render 'shared/index'
  end

  def track_item
    @inventory = Inventory.find params[:inventory_id]
    @item = Item.find params[:item_id]

    if @inventory.track_item(@item)
      respond_to do |format|
        format.js
      end
    end

  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
