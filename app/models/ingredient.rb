class Ingredient < ApplicationRecord
  belongs_to :product

  # validations
  validates :name, :product, :quantity, presence: true
end
