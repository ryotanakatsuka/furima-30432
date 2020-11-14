class OrdersController < ApplicationController
  before_action :set_item,     only:[:index,:create]
  before_action :sold_out_top
  before_action :authenticate_user!
  before_action :move_to_top
  
  def index
    @form=Form.new
  end

  

  def create
    @form=Form.new(order_address_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  
  def order_address_params
    params.require(:form).permit(:postal_code,:delivery_source_id,:city,:addresses,:building,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item=Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:   @item.price,  
      card:     order_address_params[:token],    
      currency: 'jpy'                 
    )
  end

  def move_to_top
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_out_top
    if @item.order !=nil
      redirect_to root_path
    end
  end
  
end
