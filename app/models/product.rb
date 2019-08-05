class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :reviews

  validates :name, :user, presence: true
end
