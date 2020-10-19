class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :condition_id
    validates :shipping_charges_id
    validates :delivery_source_id
    validates :delivery_date_id
    validates :price,           format:{with: /\A[a-z0-9]+\z/i,message: "is invalid. Input half-width characters."}
    validates :genre_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :delivery_date_id, numericality: { other_than: 1 } 
    validates :shipping_charges_id, numericality: { other_than: 1 } 
    validates :delivery_source_id, numericality: { other_than: 1 } 
    validates :price,numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to:9_999_999}
  end
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :genre
    belongs_to_active_hash :condition
    belongs_to_active_hash :delivery
    belongs_to_active_hash :shipping
    belongs_to_active_hash :prefecture 
    
  end