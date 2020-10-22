class ItemsController < ApplicationController
  before_action :move_to_top,only:[:edit]
  before_action :authenticate_user!, except:[:index,:show]
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
    @item=Item.find(params[:id])
  end

  def edit
    @item=Item.find(params[:id])
  end


  def update
      @item=Item.find(params[:id])
      
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
        #binding.pry
    end
  end
  private

  def item_params
    params.require(:item).permit(:name,:text,:condition_id,:delivery_source_id,:price,:image,:genre_id,:shipping_charges_id,:delivery_date_id,).merge(user_id: current_user.id)
  end

  def move_to_top
     @item=Item.find(params[:id])
    unless @item.user == current_user
      redirect_to root_path
      
    end
  end
end
