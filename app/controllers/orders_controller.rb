class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @form = Form.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(order_params)
    if @form.valid? 
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture, :city, :address, :building, :phone_number, :item_id).merge(token: params[:token],user_id: current_user[:id])
  end
  def user_params
    params.permit(:item_id).merge(user_id: current_user[:id])
  end


  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

end
