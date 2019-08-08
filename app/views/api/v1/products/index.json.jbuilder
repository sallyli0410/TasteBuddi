json.products do
  json.array! @products do |product|
    json.extract! product, :id, :name, :description, :user_id, :location_lat, :location_long, :img_url
    json.seller_name product.user.wx_name
    json.seller_avatar product.user.wx_avatar

    json.tags product.tag_list

    # average rating
    sum = 0
    product.reviews.each do |review|
      sum += review.rating
    end
    avg = sum.to_f / product.reviews.size.to_f
    json.avg_rating avg
  end
end
