require 'rails_helper'

RSpec.describe Form, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      sleep(1)
      @form = FactoryBot.build(:form, user_id: user.id, item_id: item.id)
    end

    context '商品の注文ができるとき' do
      it '全てが正しい入力であれば登録ができる' do
        expect(@form).to be_valid
      end
      it 'buildingがなくても登録ができること' do
        @form.building = ''
        @form.valid?
      end
    end

    context '商品の注文ができないとき' do
      it 'クレジットカード情報は必須であり、正しいクレジットカードの情報で無いときは決済できないこと' do
        @form.token = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end

      it '配送先の情報として、郵便番号が必須であること' do
        @form.post_code = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank", 'Post code ハイフンを含む8桁で入力してください')
      end
      it '配送先の情報として、都道府県が必須であること' do
        @form.prefecture = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '配送先の情報として、市区町村が必須であること' do
        @form.city = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it '配送先の情報として、番地・電話番号が必須であること' do
        @form.address = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it '配送先の情報として、電話番号が必須であること' do
        @form.phone_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Phone number can't be blank", 'Phone number ハイフンを除く11桁で入力してください')
      end
      it '郵便番号にはハイフンが必要であること（123-4567となる）' do
        @form.post_code = '123456'
        @form.valid?
        expect(@form.errors.full_messages).to include('Post code ハイフンを含む8桁で入力してください')
      end
      it '電話番号にはハイフンは不要で、11桁以内であること（09012345678となる）' do
        @form.phone_number = '090123456789'
        @form.valid?
        expect(@form.errors.full_messages).to include('Phone number ハイフンを除く11桁で入力してください')
      end
      it 'user_idが必須であること' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが必須であること' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
