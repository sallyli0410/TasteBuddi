require 'date'

Review.destroy_all
Booking.destroy_all
Ingredient.destroy_all
Product.destroy_all
User.destroy_all
p 'Destroyed everything'

products = [
  {
    name:'Sun-dried Tomato Pesto',
    image: 'https://lc-xjkg6hep.cn-n1.lcfile.com/33d1840796cfe9417da7/AMAZING-5-Ingredient-Sun-Dried-Tomato-Pesto-vegan-glutenfree.jpg',
    description: 'When basil isnt in season, try Sun-Dried Tomato Pesto! Made with walnuts, its punchy and sweet. Try it with pasta (of course), but also as a spread on sandwiches, as a dip with veggies, or stirred into soup!',
    location_lat: 31.230391,
    location_long: 121.473701,
    ingredients: [
          '1/2 cup walnuts (or other nut)',
          '1 cup (8 ounces) sun-dried tomatoes packed in oil',
          '3 garlic cloves, sliced',
          '3/4 cup grated Parmesan cheese',
          '1/2 teaspoon kosher salt',
          '1/4 teaspoon chili flakes (optional)',
          '1 to 2 roasted red pepper quarters, from a jar (about 1/4 cup, optional)',
          '1/2 cup good quality olive oil']
  },
  {
    name: 'Mexican Red Chili Sauce',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/b55c5cefb393cc7834d4/190425_RT-Mexican-Red-Chili-Sauce-05-06-19_029_v1_CC-900x570.jpg",
    description: 'Here is an authentic Mexican red chili sauce, made with dried Ancho chilies or Pasilla chilies. Perfect for making tamales and enchiladas',
    location_lat: 30.3,
    location_long: 119,
    ingredients: [
          '3 dried Ancho (sometimes called pasilla in the US*) chiles OR 2 Ancho and 2 Guajillo chiles
          Water',
          '1 large clove garlic',
          '2 whole cloves, crushed',
          '2 black peppercorns, crushed',
          '1/2 teaspoon of salt, more to taste',
          'Extra virgin olive oil]'],
  },
  {
    name: 'Homemade Tartar Sauce',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/5b4f2fb24b12362dbd9a/th.jpeg",
    description: 'Homemade tartar sauce with mayonnaise, dill pickles, capers, and more. It will far surpass anything you buy in a jar, and its so easy to pull off at home for serving with fish or crab cakes.',
    location_lat: 30.9,
    location_long: 118,
    ingredients: [
          '1 cup mayonnaise',
          '1/2 cup chopped dill pickles',
          '1 teaspoon capers, chopped',
          '2 teaspoons Dijon mustard',
          '2 teaspoons chopped shallots',
          '2 tablespoons chopped scallions',
          '2 teaspoons lemon juice',
          '6 drops Tabasco sauce, or more to taste',
          'Salt and pepper to taste']
  },
  {
    name: 'Chimichurri',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/b054ffb3a6f0f77f95db/th%20%281%29.jpeg",
    description: 'Argentinean chimichurri is made with chopped fresh parsley, oregano, garlic, olive oil, vinegar, and red pepper flakes. A colorful and flavorful addition, chimichurri sauce takes just 10 minutes to make!',
    location_lat: 30.9,
    location_long: 118.8,
    ingredients: [
      '1 cup firmly packed fresh flat-leaf parsley, trimmed of thick stems',
      '3-4 garlic cloves',
      '2 Tbsps fresh oregano leaves (can sub 2 teaspoons dried oregano)',
      '1/3 cup extra virgin olive oil',
      '2 tablespoons red or white wine vinegar',
      '1/2 teaspoon sea salt',
      '1/8 teaspoon freshly ground black pepper',
      '1/4 teaspoon red pepper flakes'
    ]
  },
  {
    name: 'Kale Pesto',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/e881fdb7c44c94ecf22c/HEALTHY-Super-Green-Vegan-Pesto-BIG-flavor-10-minutes-1-bowl-SO-delicious.-vegan-glutenfree-plantbased-sauce-pesto-greens-minimalistbaker-recipe-7.jpg",
    description: 'Made with tomatoes, onion, garlic, and simple Italian herbs, enjoy this delicious and healthy Marinara Sauce Recipe with pasta, lasagna, pizza, or mixed into your favorite soups.',
    location_lat: 30.9,
    location_long: 118.8,
    ingredients: [
      '3 cups (packed, 85 g) chopped fresh kale',
      '1/2 cup (60 g) toasted, blanched almonds',
      '1/2 cup (40 g) grated or shredded Parmesan',
      'Zest of one lemon (about a teaspoon)',
      '3 cloves of garlic (less or more to taste), minced',
      '1/2 cup (120 ml) extra virgin olive oil',
      '1 Tbsp lemon juice',
      '1/4 teaspoon salt',
      '1/8 teaspoon ground black pepper']
  },
  {
    name: 'Cranberry Relish',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/da969bff2d5f7d1e8930/th%20%282%29.jpeg",
    description: 'Holiday and Thanksgiving Cranberry Relish recipe. Fresh cranberries ground up with apples and orange. Great with turkey sandwiches.',
    location_lat: 34.9,
    location_long: 118.8,
    ingredients: [
        '2 cups rinsed raw cranberries',
        '2 peeled and cored tart green apples, cut into thick slices',
        '1 large, whole (peel ON) seedless orange, cut into sections',
        '1 to 2 cups granulated sugar']
  },
  {
    name: 'Mushroom Sugo',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/846734279f2ce4ece3f1/th%20%283%29.jpeg",
    description: 'A Genoese mushroom sauce for pasta or polenta, with dried porcinis, tomato, onions, celery, carrots, garlic, and a little red wine. Sugo ai Funghi.',
    location_lat: 38.9,
    location_long: 119.8,
    ingredients: [
        '1 ounce dried porcini mushrooms',
        '4 Tbsp extra-virgin olive oil',
        '2 medium yellow onions',
        '2 carrots',
        '1 1/2 cups celery ',
        '6-8 cloves garlic, peeled and minced',
        '1 bunch parsely, minced (yielding 1/3 cup loosely packed)',
        '1/2 teaspoon minced fresh rosemary',
        '1/4 teaspoon fresh thyme',
        '1/4 teaspoon fresh marjoram',
        '1/2 cup dry red wine',
        '1 15-ounce can of tomato sauce',
        '1 beef bouillon cube',
        '1 bay leaf',
        'Freshly ground black pepper']
  },
  {
    name: 'Spanish Romesco Sauce',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/b5e3cfcb4f08b38ae3b9/th%20%284%29.jpeg",
    description: 'Classic Spanish Romesco sauce, made with roasted red peppers, almonds, garlic and tomatoes.',
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
        '1/4 cup extra virgin olive oil',
        '1 1-inch thick slice of crusty bread, torn into pieces',
        '1/2 cup blanched almonds, chopped or slivered (can substitute hazelnuts, peeled)',
        '5-6 garlic cloves, chopped',
        '1 teaspoon salt',
        '1 can of crushed tomatoes',
        '1 8-ounce jar of roasted red bell peppers, drained',
        '1 tablespoon smoked paprika (preferred) or sweet paprika',
        '2-3 tablespoons sherry vinegar or red wine vinegar']
  },
  {
    name: 'Smoky Barbecue Sauce',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/76ece2aa189dae6bef49/Sweet-Smoky-Homemade-BBQ-Sauce-1.jpg",
    description: 'Its smoky! Rich, spicy, smoky barbecue sauce. Perfect for burgers, ribs, or beef brisket.',
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
        '4 Tbsp butter (can substitute vegetable oil)',
        '1/2 grated onion',
        '1 15-ounce can crushed tomatoes',
        '1/2 cup cider vinegar',
        '2 Tbsp brown sugar',
        '1/4 cup molasses',
        '1-4 chipotle chiles in adobo',
        '1 teaspoon liquid smoke',
        '1 Tbsp finely chopped fresh sage',
        'Salt to taste']
  },
  {
    name: 'Green Tomato Chutney',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/3b19f06f25c759529ae7/green-tomato-chutney-horiz-a-1800.jpg",
    description: 'Green Tomato Chutney - make use of end of season tomatoes with this sweet and vinegary green tomato chutney (green tomato relish) made with unripe tomatoes.',
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
        '2 1/2 pounds firm green tomatoes, about 7 cups, cored and chopped',
        '1 1/4 cups brown sugar, packed',
        '1 cup chopped red onion',
        '1 cup golden raisins',
        '1 cup cider vinegar',
        '2 Tbsp chopped candied ginger',
        '1 Tbsp mustard seeds',
        '1 teaspoon chili pepper flakes',
        '1 teaspoon fennel seeds',
        '1 teaspoon of salt',
        '1/2 teaspoon ground allspice',
        '1/8 teaspoon ground cloves',
        '1 cinnamon stick',
        'Pinch of ground nutmeg']
  },
  {
    name: 'Homemade Pomegranate Molasses',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/6f1e9dc13498e29a4e5f/th%20%285%29.jpeg",
    description: 'its easy to make Homemade Pomegranate Molasses! An essential ingredient in traditional Middle Eastern cooking.',
    location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
        '4 cups pomegranate juice',
        '1/2 cup sugar',
        '2 tablespoons lemon juice']
  },
  {
    name: 'Caramel Sauce',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/9c1f77e8b39d27118692/th%20%286%29.jpeg",
    description: 'Homemade Caramel Sauce is EASY to make! Takes only 10 minutes, and all you need is sugar, butter, and cream. Spoon it over ice cream, swirl it into brownies, or add it to your morning coffee.',
     location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
      '1 cup (210g) of sugar',
      '6 Tbsp (85g) butter (salted or unsalted)',
      '1/2 cup (120ml) heavy whipping cream']
  },
  {
    name: 'Ramp and Parsley Pesto',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/d5a29cdc557d418f145d/ramp-parsley-pesto-horiz-b-1800.jpg",
    description: 'If you find ramps at your local farmer’s market, make this ramp pesto! Ramps have a bright, garlicky flavor that is perfect for pesto. Toss it with pasta, spread on sandwiches, or swirl it into a spring soup.',
     location_lat: 30.9,
    location_long: 119.8,
    ingredients: [
      '2/3 cup walnuts',
      '1/2 cup extra virgin olive oil',
      '1/2 cup grated parmiggiano-reggiano cheese',
      '1 small bunch parsley',
      '1 small bunch ramps or thin green garlic',
      'Pinch of salt']
  },
  {
    name: 'Lemon-Garlic Butter Sauce for Seafood',
    image: "https://lc-xjkg6hep.cn-n1.lcfile.com/d7cc76a98c9917a03416/Crispy-Wings-In-a-Lemon-Garlic-Butter-Sauce.jpg",
    description: 'Lemon-garlic butter sauce, perfect for fish, shrimp, scallops.',
    latitude: 31.230391,
    longitude: 121.473701,
    ingredients: [
      '1/2 cup clam juice',
      '1/2 cup dry sherry',
      '1/2 cup whole milk (OR 3 Tbsp cream with 5 Tbsp water)',
      '1 Tbsp minced garlic',
      '1 Tbsp minced shallots',
      '1 bay leaf',
      '1 Tbsp unsalted butter',
      '1 Tbsp flour',
      '1/2 pound (2 sticks) unsalted butter',
      '1/2 teaspoon salt',
      '1/2 teaspoon white pepper',
      '1 Tbsp lemon juice']
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

  3.times do
    review = Review.create(content: "emmm...", rating: rand(5) + 1, product: pro, user: u)
  end

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

# p User.all
# p Product.all
# p Booking.all
# p Ingredient.all
p "reviews:"
p Review.all
