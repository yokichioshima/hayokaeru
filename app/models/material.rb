class Material < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }

  has_one_attached :image
end