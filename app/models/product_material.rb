class ProductMaterial < ApplicationRecord
  validates :single_quantity, numericality: true, allow_blank: true

  belongs_to :material
  belongs_to :product

  def save_single_quantity(product_material, single_quantity)
    product_material.single_quantity = single_quantity
    product_material.save
  end
end
