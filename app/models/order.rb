class Order < ApplicationRecord
  validates :name, presence: true
  
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
end
