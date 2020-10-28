class Form
  include ActiveModel::Model  
  attr_accessor :postal_code,:delivery_source_id,:city,:addresses,:building,:phone_number,:token,:order_id,:item_id,:user_id

  with_options presence: true do
    validates     :postal_code,   format:{ with: /\A\d{3}[-]\d{4}\z/}
    validates     :delivery_source_id
    validates     :city
    validates     :addresses
    validates     :phone_number,   format:{ with: /\A\d{11}\z/}
    validates     :token 
  end
  validates     :delivery_source_id, numericality: { other_than: 1 }

  def save
    
    order=Order.create(item_id: item_id,user_id: user_id)
    Address.create(postal_code: postal_code,city: city,addresses: addresses,building:building,phone_number:phone_number,delivery_source_id: delivery_source_id,order_id: order.id)
  end
end