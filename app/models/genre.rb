class Genre < ApplicationRecord

  has_many :items
  has_many :orders
end
