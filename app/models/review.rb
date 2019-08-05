class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :content, :user, :product, presence: true
end
