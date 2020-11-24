require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe "新規登録/ユーザー情報" do 
    before do
      @user = FactoryBot.build(:user)
    end
    it "ニックネームが必須であること" do
      user = User.new(nickname: "",email: "kkk@gmail.com", password: "q0000000", password_confirmation: "q0000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      user = User.new(nickname: "gg",email: "", password: "q0000000", password_confirmation: "q0000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      
      user = User.new(nickname: "gg",email: "kkkgmail.com", password: "q0000000", password_confirmation: "q0000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
    end
    it "メールアドレスは、@を含む必要があること" do
      user = User.new(nickname: "gg",email: "kkkgmail.com", password: "q0000000", password_confirmation: "q0000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードが必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "", password_confirmation: "q0000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "パスワードは、6文字以上での入力が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q0", password_confirmation: "q0", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "パスワードは、半角英数字混合での入力が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "パスワードは、確認用を含めて2回入力すること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q0000000", password_confirmation: "", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q0000000", password_confirmation: "q1111111", first_name:"だ", last_name:"ま", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
  describe "新規登録/本人情報確認" do
    it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q000000", password_confirmation: "q000000", first_name:"", last_name:"", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください", "Last name can't be blank", "Last name 全角文字を使用してください")
    end
    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q000000", password_confirmation: "q000000", first_name:"da", last_name:"ma", first_name_kana:"ダ", last_name_kana: "マ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("First name 全角文字を使用してください", "Last name 全角文字を使用してください")
    end
    it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q000000", password_confirmation: "q000000", first_name:"や", last_name:"ま", first_name_kana:"", last_name_kana: "", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank", "First name kana 全角カナ文字を使用してください", "Last name kana can't be blank", "Last name kana 全角カナ文字を使用してください")
    end
    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q000000", password_confirmation: "q000000", first_name:"や", last_name:"ま", first_name_kana:"a", last_name_kana: "あ", birthday: 19880924)
      user.valid?
      expect(user.errors.full_messages).to include("First name kana 全角カナ文字を使用してください", "Last name kana 全角カナ文字を使用してください")
    end
    it "生年月日が必須であること" do
      user = User.new(nickname: "gg",email: "kkk@gmail.com", password: "q000000", password_confirmation: "q000000", first_name:"や", last_name:"ま", first_name_kana:"ヤ", last_name_kana: "マ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
  end

end
