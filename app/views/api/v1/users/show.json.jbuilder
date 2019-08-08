json.extract! @user, :id, :wx_id, :wx_name, :wx_avatar, :phone_number, :seller_complete

json.products @user.products do |product|
  json.extract! product, :id, :description, :location_long, :location_lat, :name
  json.date product.created_at.strftime("%m/%d/%y")
end

# for bookings
json.bookings @user.bookings do |booking|
  json.booking_id booking.id
  json.booked_time booking.time
  # product, buyer, seller
  json.product_name booking.product.name
  json.product_id booking.product.id
  json.product_img booking.product.img_url

  json.seller_name booking.product.user.wx_name
  json.seller_avatar booking.product.user.wx_avatar
  json.seller_wx_id booking.product.user.wx_id
  json.seller_id booking.product.user.id
  # status and completedness
  json.status booking.status
  json.complete booking.completed

  json.date booking.created_at.strftime("%m/%d/%y")
end

# for requests
json.requests @requests do |request|
  json.booking_id request.id
  json.booked_time request.time
  # product, buyer, seller
  json.buyer_name request.user.wx_name
  json.buyer_avatar request.user.wx_avatar
  json.buyer_wx_id request.user.wx_id
  json.buyer_id request.user.id

  json.product_name request.product.name
  json.product_id request.product.id
  json.product_img request.product.img_url

  # status and completedness
  json.status request.status
  json.complete request.completed

  json.date request.created_at.strftime("%m/%d/%y")
end
