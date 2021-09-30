class PurchasesController < ApplicationController
  before_action :set_item, only: :index

  def index
    @purchase_destination = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)
    if @purchase_destination.valid? 
      pay_item
      @purchase_destination.save
      redirect_to root_path
    else
      set_item
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    set_item
    params.require(:purchase_destination).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: purchase_params[:price],
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
