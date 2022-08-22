class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_details

  has_one_attached :image


   def add_tax_price
     (self.price * 1.08).round
   end

end

