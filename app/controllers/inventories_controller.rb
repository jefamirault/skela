class InventoriesController < ApplicationController
  def index
    @inventories = Inventory.all
    render 'cards/index'
  end

  def new
    @inventory = Inventory.create
    render 'cards/new'
  end

  def edit
    @inventory = Inventory.find params[:id]
    render 'cards/edit'
  end

  def show
    @inventory = Inventory.find params[:id]
    render 'cards/edit'
  end

  def update
    @inventory = Inventory.find params[:id]
    @inventory.update inventory_params
  end

  def destroy
    @inventory = Inventory.find(params[:id])
    @inventory.destroy
    @inventories = Inventory.all
    render 'cards/index'
  end

  def track_item
    @inventory = Inventory.find params[:inventory_id]

    item_id_or_name = params[:inventory][:item_id]
    @item = if item_id_or_name.class == Fixnum
      Item.find item_id_or_name
    else # string
      item = Item.find_by_name item_id_or_name
      if item.nil?
        item = Item.new name: item_id_or_name
        item.save
      end
      item
    end

    if @inventory.track_item(@item)
      respond_to do |format|
        format.js
      end
    end
  end

  def remove_item
    @inventory = Inventory.find params[:inventory_id]
    @item = Item.find params[:item_id]

    @inventory.remove_item @item
  end

  def update_stock
    @inventory = Inventory.find params[:inventory_id]
    stock = Stock.find params[:inventory][:stocks_attributes]['0'][:id]
    @item = stock.item
    quantity = params[:inventory][:stocks_attributes]['0'][:quantity]

    @inventory.update_stock @item, quantity
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def inventory_params
    params.require(:inventory).permit(:name)
  end
end
