require 'date'

# <-----------------deleting all data------------------>

puts "Cleaning all data"

User.destroy_all
Booking.destroy_all
Product.destroy_all

# <------------------Create Users------------------->
puts "creating users"

5.times do
  User.create(
    wx_name: Faker::Name.unique.name,
    wx_avatar: "",
    phone_number: Faker::Number.number(digits: 11),
    seller_complete: :true,
    )
  end

puts "finished creating users"
# <------------------Create Products------------------->

puts "Creating products"

product_attributes = [
  {
    name:'Kale Pesto sauce',
    image: 'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80',
    description: 'Home made fresh kale pesto',
    location_lat: 31.22184, #review wx choose location
    location_long: 121.439884, #review wx choose location
    rating: 3,
    user_id: User.last,
  },
  {
    name: 'Malaysia Sambal Sauce',
    image: "http://theindigokitchen.com/wp-content/uploads/2016/06/IMG_7227__1464965797_86.82.108.171-1024x819-1160x665.jpg",
    description: 'Authentic Malaysian spicy sambal sauce',
    location_lat: 31.22184, #review wx choose location
    location_long: 121.439884, #review wx choose location
    rating: 5,
    user_id: User.last,
  },
  {
    name: 'Kumquat Chilli Chuntney',
    image:"https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2014-r-xl-kumquat-and-pineapple-chutney.jpg?itok=-S4ebOu-",
    description: 'Delicous Sweet and Spicy kumquat, lime and chilli chuntney',
    location_lat: 31.22184, #review wx choose location
    location_long: 121.439884, #review wx choose location
    rating: 5,
    user_id: User.last,
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
