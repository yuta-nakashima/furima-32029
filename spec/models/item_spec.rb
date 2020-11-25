require 'rails_helper'

#bundle exec rspec spec/models/item_spec.rb

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "商品の出品登録" do
    before do
      @item = FactoryBot.build(:item)
    end
    it "商品画像を1枚つけることが必須であること" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名が必須であること" do
      @item[:name] = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "商品の説明が必須であること" do
      @item[:explanation] = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーの情報が必須であること" do
      @item[:category_id] = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態についての情報が必須であること" do
      @item[:condition_id] = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "配送料の負担についての情報が必須であること" do
      @item[:delivery_fee_id] = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end
    it "発送元の地域についての情報が必須であること" do
      @item[:delivery_from_id] = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery from can't be blank")
    end
    it "発送までの日数についての情報が必須であること" do
      @item[:delivery_date_id] = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it "価格についての情報が必須であること" do
      @item[:price] = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not a number")
    end
    it "価格の範囲が、¥300~¥9,999,999の間であること" do
      @item[:price] = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      @item[:price] = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end
    it "販売価格は半角数字のみ保存可能であること" do
      @item[:price] = "aa"
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end
