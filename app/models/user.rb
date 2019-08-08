class User < ApplicationRecord
  has_many :products
  has_many :reviews
  has_many :bookings
  acts_as_taggable_on :tags
  acts_as_favoritor
end
