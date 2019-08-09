class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :reviews, dependent: :destroy
  acts_as_taggable_on :tags
  # acts_as_favoritable

  validates :name, :user, presence: true
end
