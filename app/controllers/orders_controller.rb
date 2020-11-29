class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_params, only: [:index, :create]

  def index
    @form = Form.new
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end

  def create
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

  def item_params
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end

end
