require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do

    #正常に動いてる場合
    it "全ての項目が存在すれば出品できる" do
      expect(@item).to be_valid
    end

    #バリデーション
    it "item_nameが空だと出品できない" do
      @item.item_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it "textが空だと出品できない" do
      @item.text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end

    it "priceが空だと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが半角でないと出品できない" do
      @item.price = "１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが300以下だと出品できない" do
      @item.price = "150"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9999999以上だと出品できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 9999999")
    end

    it "画像が空だと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "categoryが空だと出品できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it "statusが空だと出品できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end

    it "burdenが空だと出品できない" do
      @item.burden_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden must be other than 1")
    end

    it "prefectureが空だと出品できない" do
      @item.prefecture_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "ship_dayが空だと出品できない" do
      @item.ship_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Ship day must be other than 1")
    end

    it "userと紐づいてなければ出品できない" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end
