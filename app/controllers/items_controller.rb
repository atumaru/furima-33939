class ItemsController < ApplicationController
  def index
  end

 def edit
  @item = Item.new
  unless user.signed_in?
    root_to new_user_session
  end

end
