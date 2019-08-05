class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # validations
  validates :user, :product, :date, :time, :status, presence: true
end
