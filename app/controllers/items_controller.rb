class ItemsController < ApplicationController
  # before_action :authenticate_user!, except[:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @items = Items.new(item_params)
  end


  private
  def item_params
   params.require(:item).permit(:image, :name, :price, :explanation, :category_id, :condition_id, :delivery_from_id, :delivery_fee_id, :delivery_date_id)
  end
end