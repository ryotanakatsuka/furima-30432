require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    @form=FactoryBot.build(:form)
  end
  describe "住所登録ができる"do
   context "登録できる時"do
      it "postal_cord,delivery_source_id,city,addresses,phone_number,tokenが存在すれば登録できる"do
      expect(@form).to be_valid
      end
   end
   context "住所登録ができない時"
      it "postal_codeが空では登録できない"do
      @form.postal_code=""
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it "postal_codeに[-]がない場合、登録できない"do
      @form.postal_code="1234567"
      @form.valid?
      expect(@form.errors.full_messages).to include("Postal code is invalid")
      end
      it "delivery_source_idが空では登録できない"do
      @form.delivery_source_id=""
      @form.valid?
      expect(@form.errors.full_messages).to include("Delivery source can't be blank", "Delivery source is not a number")
      end
      it "cityが空では登録できない" do
      @form.city=""
      @form.valid?
      expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it "addressesがからでは登録できない"do
      @form.addresses=""
      @form.valid?
      expect(@form.errors.full_messages).to include("Addresses can't be blank")
      end
      it "phone_numberが空では登録できない"do
      @form.phone_number=""
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it "phone_numberが11桁でなければ登録できない"do
      @form.phone_number="090123456789"
      @form.valid?
      expect(@form.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できない"do
        @form.token=""
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
    end
end
