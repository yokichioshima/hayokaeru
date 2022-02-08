class ProductMaterial < ApplicationRecord
  validates :single_quantity, numericality: true, allow_blank: true
  
  belongs_to :material
  belongs_to :product 
end
