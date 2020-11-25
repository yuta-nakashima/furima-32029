class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action : only: [:index, :create]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :category_id, :condition_id, :delivery_from_id, :delivery_fee_id, :delivery_date_id).merge(user_id: current_user.id)
  end
end
