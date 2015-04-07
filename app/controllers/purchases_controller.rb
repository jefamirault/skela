class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all.where(user: current_user)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @purchase = Purchase.new
    @purchase.user = current_user
    @purchase.save
  end

  def create
    @purchase = Purchase.create
  end

  def update
    @purchase = Purchase.find params[:id]
    @purchase.update purchase_params
  end

  def destroy
    @purchase = Purchase.find params[:id]
    @purchase.destroy
  end

  private

  def purchase_params
    params.require(:purchase).permit(:title, :need, :cost, :purchased_at, :purchase_link)
  end
end
