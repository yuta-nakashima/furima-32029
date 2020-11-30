class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_params_id, only: [:show, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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

  def destroy
    @item.destroy
    redirect_to root_path

  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :price, :explanation, :category_id, :condition_id, :delivery_from_id, :delivery_fee_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def item_params_id
    @item = Item.find(params[:id])
  end


end
