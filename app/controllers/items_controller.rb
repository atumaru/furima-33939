class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
  end
end

def create
  @item = Item.save(item_params)
end

private
def item_params
  params.require(:item).permit(:name,:info,:category,:sales_status,:shipping_fee_status,:prefecture,:scheduled_delivery,:price).merge(user_id: current_user.id)
end
end