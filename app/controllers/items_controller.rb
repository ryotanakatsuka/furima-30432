class ItemsController < ApplicationController
  def index
    
    @items=Item.includes(:user).order("created_at DESC")
  end
  def new
    @item=Item.new
  end
  
  def create
    
      @item=Item.new(item_params)
     if @item.valid?
        @item.save
        redirect_to root_path
      else
        render :new
      end 
  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:condition_id,:delivery_source_id,:price,:image,:genre_id,:shipping_charges_id,:delivery_date_id,).merge(user_id: current_user.id)
  end
end
