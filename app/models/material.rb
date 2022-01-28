class Material < ApplicationRecord
  validates :name, presence: true
  validates :category_id, presence: true

  has_one_attached :image
end