class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer
  has_many :items, through: :order_details

  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済み:4}

  validates :payment_method, presence: true

  def temporary_information_input(current_customer_id)
    self.customer_id = current_customer_id
    self.shipping_fee = 800
    self.bill = 1
  end

   def order_in_postal_code_address_name(postal_code, address, name)
    self.postal_code = postal_code
    self.address = address
    self.name = name
  end

end
