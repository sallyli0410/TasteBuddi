class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validations
  validates :user, :product, :time, :status, presence: true
end
