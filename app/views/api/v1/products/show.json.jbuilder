json.extract! @product, :id, :name, :description, :location_lat, :location_long, :user_id

# seller info
json.seller do
  json.name @product.user.wx_name
  json.avatar @product.user.wx_avatar
  json.phone @phone_number
end

# average rating?
sum = 0
@product.reviews.each do |review|
  sum += review.rating
end
avg = sum.to_f / @product.reviews.size.to_f
json.avg_rating avg

# reviews
json.reviews @product.reviews do |review|
  json.id review.id
  json.content review.content
  json.rating review.rating

  # reviewer info
  json.reviewer_wx_name review.user.wx_name
  json.reviewer_wx_avatar review.user.wx_avatar
  json.reviewer_wx_id review.user.wx_id
end

# ingredients
json.ingredients do
  json.array! @ingredients do |ingredient|
    json.extract! ingredient, :id, :name
  end
end
