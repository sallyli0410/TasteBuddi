require 'date'

Booking.destroy_all
Product.destroy_all
User.destroy_all
p 'Destroyed everything'

products = [
  {
    name:'Kale Pesto sauce',
    image: 'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80',
    description: 'Home made fresh kale pesto with fresh mint',
    location_lat: 30.0,
    location_long: 30.0
  },
  {
    name: 'Malaysia Sambal Sauce',
    image: "http://theindigokitchen.com/wp-content/uploads/2016/06/IMG_7227__1464965797_86.82.108.171-1024x819-1160x665.jpg",
    description: 'Authentic Malaysian spicy sambal sauce',
    location_lat: 0.3,
    location_long: 60.9
  },
  {
    name: 'Kumquat Chilli Chuntney',
    image: "https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2014-r-xl-kumquat-and-pineapple-chutney.jpg?itok=-S4ebOu-",
    description: 'Delicous Sweet and Spicy kumquat, lime and chilli chuntney',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Spicy Peanut Sauce',
    image: "https://cn.bing.com/th?id=OIP.7-Lxx7ZGkzTQMz62EYWI6AHaKL&pid=Api&rs=1",
    description: 'Spicy peanut sauce, perfect for satay marinated skewers and dipping',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'MARINARA SAUCE RECIPE',
    image: "https://cookieandkate.com/images/2018/03/best-marinara-sauce-recipe-2.jpg",
    description: 'Made with tomatoes, onion, garlic, and simple Italian herbs, enjoy this delicious and healthy Marinara Sauce Recipe with pasta, lasagna, pizza, or mixed into your favorite soups.',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Thai Sweet Chili Sauce',
    image: "http://www.chocolatemoosey.com/wp-content/uploads/2012/09/Sweet-Chili-Sauce-8973.jpg",
    description: 'Thai family recipe for sweet chilli sauce',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Barbecue Sauce',
    image: "https://cn.bing.com/th?id=OIP.YcDSQHtk-qUq8dYBNNMc2gHaFj&pid=Api&rs=1",
    description: 'Sweet barbecue sauce with a little kick made Kansas City way',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Authentic Teriyaki Sauce',
    image: "https://cn.bing.com/th?id=OIP.AhDgMmNFONyVsJAqyjPxjwHaLL&pid=Api&rs=1",
    description: 'Umami Teriyaki sauce perfect for special occasions',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Homemade Steak Sauce',
    image: "http://www.simplyscratch.com/wp-content/uploads/2013/03/steak-sauce-1.jpg",
    description: 'Peppery steak sauce',
    location_lat: 10.9,
    location_long: 51.8
  },
  {
    name: 'Peri Peri Mayo',
    image: "https://cn.bing.com/th?id=OIP.h45brCr4WmMy0NLGOHXyMwHaFq&pid=Api&rs=1",
    description: 'Easy to make and taste just fantastic peri peri mayo',
    location_lat: 10.9,
    location_long: 51.8
  }
]

3.times do
  # create sellers
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
