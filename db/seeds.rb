require 'date'

Booking.destroy_all
Ingredient.destroy_all
Product.destroy_all
User.destroy_all
p 'Destroyed everything'

products = [
  {
    name:'Kale Pesto sauce',
    image: 'https://images.unsplash.com/photo-1519623286359-e9f3cbef015b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80',
    description: 'Home made fresh kale pesto with fresh mint',
    avg_rating:2,
    location_lat: 30.0,
    location_long: 119,
    ingredients: ['basil', 'kale', 'olive oil']
  },
  {
    name: 'Malaysia Sambal Sauce',
    image: "http://theindigokitchen.com/wp-content/uploads/2016/06/IMG_7227__1464965797_86.82.108.171-1024x819-1160x665.jpg",
    description: 'Authentic Malaysian spicy sambal sauce',

    avg_rating:3,
    location_lat: 30.3,
    location_long: 119,
    ingredients: ['chilies', 'garlic', 'lemongrass', 'shallots', 'ginger']
  },
  {
    name: 'Kumquat Chilli Chuntney',
    image: "https://cdn-image.foodandwine.com/sites/default/files/styles/medium_2x/public/2014-r-xl-kumquat-and-pineapple-chutney.jpg?itok=-S4ebOu-",
    description: 'Delicous Sweet and Spicy kumquat, lime and chilli chuntney',
    avg_rating:4,
    location_lat: 30.9,
    location_long: 118,
    ingredients: ['orange juice', 'cranberry', 'cinnamon', 'cloves']
  },
  {
    name: 'Spicy Peanut Sauce',
    image: "https://cn.bing.com/th?id=OIP.7-Lxx7ZGkzTQMz62EYWI6AHaKL&pid=Api&rs=1",
    description: 'Spicy peanut sauce, perfect for satay marinated skewers and dipping',
    avg_rating: 2,
    location_lat: 30.9,
    location_long: 118.8,
    ingredients: ['chilies', 'peanut']
  },
  {
    name: 'MARINARA SAUCE RECIPE',
    image: "https://cookieandkate.com/images/2018/03/best-marinara-sauce-recipe-2.jpg",
    description: 'Made with tomatoes, onion, garlic, and simple Italian herbs, enjoy this delicious and healthy Marinara Sauce Recipe with pasta, lasagna, pizza, or mixed into your favorite soups.',
    avg_rating: 3,
    location_lat: 30.9,
    location_long: 118.8,
    ingredients: ['tomato', 'salt', 'black pepper', 'garlic', 'olive oil', 'white wine']
  },
  {
    name: 'Thai Sweet Chili Sauce',
    image: "http://www.chocolatemoosey.com/wp-content/uploads/2012/09/Sweet-Chili-Sauce-8973.jpg",
    description: 'Thai family recipe for sweet chilli sauce',
    avg_rating:3,
    location_lat: 34.9,
    location_long: 118.8,
    ingredients: ['white sugar', 'chilies', 'garlic', 'salt']
  },
  {
    name: 'Barbecue Sauce',
    image: "https://cn.bing.com/th?id=OIP.YcDSQHtk-qUq8dYBNNMc2gHaFj&pid=Api&rs=1",
    description: 'Sweet barbecue sauce with a little kick made Kansas City way',
    avg_rating: 1,
    location_lat: 38.9,
    location_long: 119.8,
    ingredients: ['honey', 'ketchup', 'salt']
  },
  {
    name: 'Authentic Teriyaki Sauce',
    image: "https://cn.bing.com/th?id=OIP.AhDgMmNFONyVsJAqyjPxjwHaLL&pid=Api&rs=1",
    description: 'Umami Teriyaki sauce perfect for special occasions',
    avg_rating: 3,
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: ['soy sauce', 'sweet rice wine', 'garlic', 'ginger']
  },
  {
    name: 'Homemade Steak Sauce',
    image: "http://www.simplyscratch.com/wp-content/uploads/2013/03/steak-sauce-1.jpg",
    description: 'Peppery steak sauce',
    avg_rating: 3,
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: ['ketchup', 'onion', 'clove', 'garlic', 'mustard', 'soy sauce', 'olive oil', 'lemon juice', 'vinegar', 'brown sugar']
  },
  {
    name: 'Peri Peri Mayo',
    image: "https://cn.bing.com/th?id=OIP.h45brCr4WmMy0NLGOHXyMwHaFq&pid=Api&rs=1",
    description: 'Easy to make and taste just fantastic peri peri mayo',
    avg_rating: 5,
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: ['egg yolk', 'salt', 'mustard', 'lemon juice', 'vinegar']
  }
]

10.times do |i|
  # create sellers
  u = User.create(
    wx_name: Faker::Name.unique.name,
    wx_avatar: "",
    phone_number: Faker::Number.number(digits: 11),
    seller_complete: true
  )
  # for each seller, create products

  p_info = products[i]
  pro = Product.create(name: p_info[:name], description: p_info[:description], img_url: p_info[:image], location_long: p_info[:location_long], location_lat: p_info[:location_lat], user: u)
  p_info[:ingredients].each do |ing|
    Ingredient.create(name: ing, product: pro)
  end
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
p Ingredient.all
