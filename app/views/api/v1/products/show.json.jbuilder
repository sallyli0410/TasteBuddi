json.extract! @product, :id, :name, :description, :location_long, :location_long, :user_id

# seller info
json.seller do
  json.name @seller.wx_name
  json.avatar @seller.wx_avatar
  json.phone @phone_number
end

# average rating?

# reviews
json.reviews @product.reviews do |review|
  json.id review.id
  json.content review.content
  json.rating review.rating

  # buyer info
  json.buyer_name review.user.wx_name
  json.buyer_name review.user.wx_avatar
  json.buyer_name review.user.wx_id
end

# ingredients
json.ingredients do
  json.array! @ingredients do |ingredient|
    json.extract! ingredient, :id, :name
  end
end
