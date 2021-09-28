class PurchasesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid? 
      @purchase_destination.save
        redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_destination).permit(:postcode, :prefecture, :city, :block, :building, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

end
