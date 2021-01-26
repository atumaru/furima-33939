require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品" do

    context "商品出品できるとき" do
      it "imageとnameとinfoとcategory_idとsales_status_idとshipping_fee_status_idとprefecture_idとscheduled_id,priceが入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品できないとき" do
      it "imageがないと出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameがないと出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "infoがないと出品できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it "category_idがないと出品できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank", "Category is not a number"
      end
      it "sales_statusがないと出品できない" do
        @item.sales_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank", "Sales status is not a number"
      end
      it "shipping_fee_status_idがないと出品できない" do
        @item.shipping_fee_status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank", "Shipping fee status is not a number"
      end
      it "prefecture_idがないと出品できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end
      it "scheduled_delivery_idがないと出品できない" do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank", "Scheduled delivery is not a number"
      end

      it "priceがないと出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not included in the list", "Price is invalid"
      end
      it "priceが300だと出品できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include  "Price is not included in the list"
    end
    it "priceが100000000以上だと登録できない" do
    @item.price = 100000000
    @item.valid?
    expect(@item.errors.full_messages).to include "Price is not included in the list"
    end
    it "userが紐付いていないと登録できない" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include "User must exist"
  end
    end
  end
end

