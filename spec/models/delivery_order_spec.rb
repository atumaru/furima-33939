# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DeliveryOrder, type: :model do
  before do
    @delivery_order = FactoryBot.build(:delivery_order)
  end

  describe '商品購入' do
    context '購入できるとき' do
      it 'tokenとpostal_codeとprefecture_idとcityとaddressとphone_numberが入力されていれば購入できる' do
        expect(@delivery_order).to be_valid
      end
      it 'buildingが入力されていなくても購入できる' do
      @delivery_order.building = ""
      expect(@delivery_order).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空だと購入できない' do
        @delivery_order.token = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "Token can't be blank"
      end
      it 'postal_codeが空だと購入できない' do
        @delivery_order.postal_code = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "Postal code can't be blank", 'Postal code is invalid'
      end

      it 'postal_codeが3桁-4桁でないと購入できない(例：123-456では購入できない)' do
        @delivery_order.postal_code = '123-456'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it 'prefecture_idが1だと購入できない' do
        @delivery_order.prefecture_id = 1
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it 'cityが空だと購入できない' do
        @delivery_order.city = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "City can't be blank"
      end

      it 'addressが空だと購入できない' do
        @delivery_order.address = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "Address can't be blank"
      end

      it 'phone_numberが空だと購入できない' do
        @delivery_order.phone_number = ''
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "Phone number can't be blank"
      end

      it 'phone_numberに全角英数字があると購入できない' do
        @delivery_order.phone_number = '9999999999９'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include 'Phone number is invalid'
      end

      it 'phone_numberに全角文字があると購入できない' do
        @delivery_order.phone_number = '9999999999木'
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include 'Phone number is invalid'
      end
      
      it 'user_idが空だと購入できない' do
        @delivery_order.user_id = nil
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "User can't be blank"
      end


      it 'item_idが空だと購入できない' do
        @delivery_order.item_id = nil
        @delivery_order.valid?
        expect(@delivery_order.errors.full_messages).to include "Item can't be blank"
      end





    end
  end
end
