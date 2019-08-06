json.products do
  json.array! @products do |product|
    json.extract! product, :id, :name, :description, :user_id, :location_lat, :location_long
    json.seller_name product.user.wx_name
    json.seller_avatar product.user.wx_avatar
  end
end
