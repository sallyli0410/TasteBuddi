require 'date'
require "open-uri"
require "nokogiri"
# <-----------------deleting all data------------------>

puts "Cleaning all data"

User.destroy_all
Booking.destroy_all
Products.destroy_all

# <------------------Create Users------------------->
puts "creating users"

5.times do
  u = User.create(
    wx_name: Faker::Name.unique.name,
    wx_avatar: "",
    phone_number: Faker::Number.number(digits: 11),
    seller_complete: :false,
    )
  end

# <------------------Create Products------------------->

puts "Creating products"

product_attributes = [
  {
    name:'Kale Pesto sauce',
    image: 'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80',
    description: 'Home made fresh kale pesto',
    location_lat: null, #review wx choose location
    location_long: null, #review wx choose location
    rating: 3,
    user_id: u,
  },
  {
    name: 'Malaysia Sambal Sauce',
    image: "http://theindigokitchen.com/wp-content/uploads/2016/06/IMG_7227__1464965797_86.82.108.171-1024x819-1160x665.jpg",
    description: 'Authentic Malaysian spicy sambal sauce',
    location_lat: null, #review wx choose location
    location_long: null, #review wx choose location
    rating: 5,
    user_id: u,
  },
  {
    name: 'Kumquat Chilli Chuntney',
    image:"https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2014-r-xl-kumquat-and-pineapple-chutney.jpg?itok=-S4ebOu-",
    description: 'Delicous Sweet and Spicy kumquat, lime and chilli chuntney',
    location_lat: null, #review wx choose location
    location_long: null, #review wx choose location
    rating: 5,
    user_id: u,
  }
]

Product.create!(product_attributes)
puts 'Finished creating products!'

# <------------------create Bookings------------------->
puts "Creating bookings"

5.times do
  Booking.create(
    status: false,
    date: Date.today + (0..5).to_a.sample,
    time: rand(16..20),
    product: Product.sample
    )
end

puts "Finished creating bookings"

