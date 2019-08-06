json.extract! @user, :id, :wx_id, :wx_name, :wx_avatar, :phone_number, :seller_complete

json.products @user.products do |product|
  json.extract! product, :id, :description, :location_long, :location_lat, :name
  json.date product.created_at.strftime("%m/%d/%y")
end

# for bookings
json.bookings @user.bookings do |booking|
  json.id booking.id
  json.booked_time booking.time
  # product, buyer, seller
  json.buyer_name booking.user.wx_name
  json.product_name booking.product.name
  json.seller_name booking.product.user.wx_name
  # status and completedness
  json.status booking.status
  json.complete booking.completed

  json.date booking.created_at.strftime("%m/%d/%y")
end

# for requests
json.requests @requests do |request|
  json.id request.id
  json.booked_time request.time
  # product, buyer, seller
  json.buyer_name request.user.wx_name
  json.product_name request.product.name
  # status and completedness
  json.status request.status
  json.complete request.completed

  json.date request.created_at.strftime("%m/%d/%y")
end
