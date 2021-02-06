require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe "商品購入機能" do

  context'内容に問題がない場合'do
    it "全ての項目が存在すれば出品できる" do
      expect(@purchase_address).to be_valid
    end

    it "buidingが空でも出品できる" do
      @purchase_address.building = ""
      expect(@purchase_address).to be_valid
    end
  end

  context'内容に問題がある場合'do
  it "postal_codeが空だと出品できない" do
    @purchase_address.postal_code = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
  end

  it "postal_codeには、-が必要" do
    @purchase_address.postal_code = "1234567"
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
  end

  it "cityが空だと出品できない" do
    @purchase_address.city = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("City can't be blank")
  end

  it "addressが空だと出品できない" do
    @purchase_address.address = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Address can't be blank")
  end

  it "phone_numberが空だと出品できない" do
    @purchase_address.phone_number = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
  end

  it "phone_numberには-はいらない" do
    @purchase_address.phone_number = "090-6371-8818"
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
  end

  it "phone_numberは11桁以内" do
    @purchase_address.phone_number = "090123456789"
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
  end

  it "prefecture_idが空だと出品できない" do
    @purchase_address.prefecture_id = 1
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Prefecture must be other than 1")
  end

  it "tokenが空だと出品できない" do
    @purchase_address.token = ""
    @purchase_address.valid?
    expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
  end
  end
  end
end
