require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  # 正常に動いてる場合のテスト

  describe "ユーザー新規登録" do
    it "全ての項目が存在すれば登録できる" do
      expect(@user).to be_valid
    end

  # バリデーション
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "full_surnameが空だと登録できない" do
      @user.full_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Full surname can't be blank")
    end

    it "full_nameが空だと登録できない" do
      @user.full_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Full name can't be blank")
    end

    it "half_surnameが空だと登録できない" do
      @user.half_surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Half surname can't be blank")
    end

    it "half_nameが空だと登録できない" do
      @user.half_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Half name can't be blank")
    end

    it "誕生日が空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "passwordが一致してないと登録できない" do
      @user.password_confirmation = "remu145"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "アドレスは一意性" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "emailには、@が含まれている" do
      @user.email = "testexample"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "パスワードが5文字以下なら登録できない" do
      @user.password = "tohu1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数混合" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "full_surnameは全角でなければ登録できない" do
      @user.full_surname = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Full surname 全角文字を使用してください")
    end

    it "full_nameは全角でなければ登録できない" do
      @user.full_name = "test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Full name 全角文字を使用してください")
    end

    it "half_surnameは全角カタカナでなければ登録できない" do
      @user.half_surname = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Half surname 全角(カタカナ)を使用してください")
    end

    it "half_nameは全角カタカナでなければ登録できない" do
      @user.half_name = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Half name 全角(カタカナ)を使用してください")
    end

  end
end

