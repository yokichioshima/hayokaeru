class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :image, presence: true
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }

  has_one_attached :image
  has_many :product_materials
  has_many :products, through: :product_materials
end