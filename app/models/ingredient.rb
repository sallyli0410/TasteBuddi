class Ingredient < ApplicationRecord
  belongs_to :product

  # validations
  validates :name, :product, presence: true
end
