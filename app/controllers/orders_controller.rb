class OrdersController < ApplicationController

  def index
    @delivery_order = DeliveryOrder.new
    @item = Item.find(params[:item_id])
    
    
    
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

  

  def user_order_params
    @item = Item.find(params[:item_id])
    params.require(:delivery_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id:current_user.id,item_id:@item.id,token: params[:token])
  end

 
  
  def pay_item
    
     @item = Item.find(params[:item_id])
     
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       
      amount: @item.price,  
      card: user_order_params[:token],
      currency: 'jpy'                 
    )
  end
  
  


end
