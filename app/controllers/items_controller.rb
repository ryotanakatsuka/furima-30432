class ItemsController < ApplicationController
  before_action :move_to_top,only:[:edit]
  before_action :authenticate_user!, except:[:index,:show]
  before_action :set_item,    only:[:edit,:show,:update]
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

  def show
   
  end

  def edit
    
  end


  def update
      
      
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
        
    end
  end
  private

  def item_params
    params.require(:item).permit(:name,:text,:condition_id,:delivery_source_id,:price,:image,:genre_id,:shipping_charges_id,:delivery_date_id,).merge(user_id: current_user.id)
  end

  def move_to_top
     @item=Item.find(params[:id])
    unless @item.user == current_user
      redirect_to new_user_session_path
      
    end
    def set_item
      @item=Item.find(params[:id])
    end
  end
end
