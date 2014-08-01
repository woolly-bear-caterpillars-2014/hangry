require_relative '../config/application'
require_relative '../app/models/restaurant'
require_relative '../app/models/cuisine'
require 'yelp'



client=Yelp.client.configure do |config|
  config.consumer_key = 'DPZYEdIjGRYlDl3xJLjgVQ'
  config.consumer_secret = 'un5f_RE6bl3OIPclS275pLfseso'
  config.token = 'Pb1A764f1ynDOHLQ3wcIMO8gWKiWqFAm'
  config.token_secret = 'dJlA4uMKB3HKhmMF-GHtnIcIv08'
end

module Create
  def self.restaurants(array)
    array.each do |object|
      Restaurant.create!(
      cuisine: Cuisine.find_or_create_by(name: object.categories[0][0]),
      name: object.name,
      address: object.location.display_address[0],
      zip: object.location.postal_code,
      yelp_rating: object.rating,
      description: object.snippet_text,
      url: object.url)
    end
  end

  def self.cuisine
    Cuisine.create!
  end


end

nyc_zips=[11211, 10005, 10006, 10007, 10038, 10280, 10002, 10003, 10009, 10021, 10028, 10044, 10128, 10023, 10024, 10025]

nyc_zips.each do |zip|
  Create.restaurants(Yelp.client.search(zip, term: "food").businesses)
end


# initial_query=Yelp.client.search(10003, term: 'food', sort: 2).businesses
# Create.restaurants(initial_query)

