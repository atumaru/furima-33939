# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[index create]
  before_action :set_item, only: %i[index move_to_root item_sold_out pay_item]
  before_action :move_to_root, only: [:index]
  before_action :item_sold_out, only: [:index]
  def index
    @delivery_order = DeliveryOrder.new
  end

  def create
    @delivery_order = DeliveryOrder.new(user_order_params)

    if @delivery_order.valid?
      pay_item
      @delivery_order.save

      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_root
    redirect_to root_path if current_user.id == @item.user_id
  end

  def item_sold_out
    redirect_to root_path unless @item.order.nil?
   end

  def user_order_params
    @item = Item.find(params[:item_id])
    params.require(:delivery_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_order_params[:token],
      currency: 'jpy'
    )
  end
end
