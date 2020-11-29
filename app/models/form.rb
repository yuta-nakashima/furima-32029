class Form
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture, :city, :address, :building, :phone_number, :item_id, :token, :user_id
  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :post_code,  format: {with: /\A\d{3}[-]\d{4}\z/,message: "ハイフンを含む8桁で入力してください"}
    validates :prefecture
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/,message:"ハイフンを除く11桁で入力してください"}
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    @order = Order.create(item_id: item_id, user_id: user_id)
    Delivery.create(post_code: post_code, prefecture: prefecture, city: city, address: address, phone_number: phone_number, order_id: @order.id)
  end
end
