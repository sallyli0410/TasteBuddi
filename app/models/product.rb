class Product < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :reviews
  acts_as_taggable_on :tags

  validates :name, :user, presence: true
end
