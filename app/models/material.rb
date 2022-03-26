class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :image, presence: true
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
  validates :quantity_unit, presence: true

  has_one_attached :image
  has_many :products, through: :product_materials
  has_many :product_materials
end
