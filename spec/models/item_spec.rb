require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item=FactoryBot.build(:item)
  end
  
  describe "商品出品機能" do
    context "出品できる時" do
      it "name,text,condition_id,shipping_charges_id,delivery_source_id,delivery_date_id,price,genre_id,が存在すれば出品できる" do
        expect(@item).to be_valid
      end
      
      it "priceの値が３００以上ならば出品できる"do
          @item.price= 333
          expect(@item).to be_valid
      end
      it "priceが９９９９９９９以下なら出品できる" do
        @item.price="9999998"
        expect(@item).to be_valid
      end
      it "priceが半角英数ならば出品できる"do
        @item.price=333123
        expect(@item).to be_valid
      end
    end

    context "出品できない時" do
      it "nameが空では出品できない" do
        @item.name=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では出品できない" do
        @item.text=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "condition_idが空では出品できない" do
        @item.condition_id=1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "shipping_charges_idが空では出品できない" do
        @item.shipping_charges_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end
      it "delivery_source_idが空では出品できない" do
        @item.delivery_source_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source must be other than 1")
      end
      it "delivery_date_idが空では出品できない" do
        @item.delivery_date_id=1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 1")
      end
      it "priceが空では出品できない" do
        @item.price=""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "genre_idが空では出品できない" do
        @item.genre_id=1
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Genre must be other than 1")
      end
      it "priceの値が３００より小さいと出品できない" do
        @item.price="299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceの値が９９９９９９９より大きければ出品できない" do
        @item.price="10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "priceが半角英数以外では出品できない"do
        @item.price= "１２３４"
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageが空では出品できない" do
        @item.image=nil
        @item.valid?
       
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
