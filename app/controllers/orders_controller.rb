class OrdersController < ApplicationController

  def index
    @delivery_order = DeliveryOrder.new
    @item = Item.find(params[:item_id])
    
    
    
  end

          

  def create
    @delivery_order = DeliveryOrder.new(user_order_params)
    
    if @delivery_order.valid? 
      @delivery_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  

  private

  

  def user_order_params
    @item = Item.find(params[:item_id])
    params.require(:delivery_order).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id:current_user.id,item_id:@item.id)
  end
  
  
  


end
