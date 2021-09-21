class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
        redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :condition_id, :shipping_cost_responsible_id, :shipping_from_id, :shipping_date_id, :price).merge(user_id: current_user.id)
  end
end
