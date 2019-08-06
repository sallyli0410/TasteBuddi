require 'date'

Booking.destroy_all
Product.destroy_all
User.destroy_all

products = [
  {
    name:'Kale Pesto sauce',
    image: 'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80',
    description: 'Home made fresh kale pesto',
    location_lat: 30.0, #review wx choose location
    location_long: 30.0 #review wx choose location
  },
  {
    name: 'Malaysia Sambal Sauce',
    image: "http://theindigokitchen.com/wp-content/uploads/2016/06/IMG_7227__1464965797_86.82.108.171-1024x819-1160x665.jpg",
    description: 'Authentic Malaysian spicy sambal sauce',
    location_lat: 0.3, #review wx choose location
    location_long: 60.9 #review wx choose location
  },
  {
    name: 'Kumquat Chilli Chuntney',
    image: "https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2014-r-xl-kumquat-and-pineapple-chutney.jpg?itok=-S4ebOu-",
    description: 'Delicous Sweet and Spicy kumquat, lime and chilli chuntney',
    location_lat: 10.9, #review wx choose location
    location_long: 51.8 #review wx choose location
  }
]

3.times do
  #create sellers
  u = User.create(
    wx_name: Faker::Name.unique.name,
    wx_avatar: "",
    phone_number: Faker::Number.number(digits: 11),
    seller_complete: true
  )
  # for each seller, create products
  p_info = products.sample
  pro = Product.create(name: p_info[:name], description: p_info[:description], img_url: p_info[:image], location_long: p_info[:location_long], location_lat: p_info[:location_lat], user: u)
end

# create buyers and their bookings
2.times do
  buyer = User.create(
    wx_name: Faker::Name.unique.name,
    wx_avatar: "",
    phone_number: Faker::Number.number(digits: 11),
    seller_complete: false
  )
  # create a booking
  Booking.create(
    status: 'pending',
    time: Time.now + rand(90000..100000),
    product: Product.all.sample,
    user: buyer,
    completed: false
  )
end

p User.all
p Product.all
p Booking.all
# 5.times do
#   Booking.create(
#     status: false,
#     date: Date.today + (0..5).to_a.sample,
#     time: rand(5) + 16, # [16, 20]
#     product: Product.sample
#     # user: ?
#   )
# end
