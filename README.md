# User Stories

## Users can ...
  - "like" a restaurant
  - "spin" the wheel to choose a type of cuisine
  - register, login and logout 

## Restaurants can ...
  - be "liked" by users
  - be filtered by type of cuisine, location and hours
  - <b>Stretch:</b> show their location through Google Maps API

## "Meal" of Fortune ...
  - Users will spin a wheel of different types of cuisines 
  - Will return a list of open restaurants of that cuisine nearby

```ruby

@businesses = HTTParty.get("https://api.yelp.com/v3/businesses/search?categories=#{cuisine}")["businesses"]
# returns an array of hashes 
# each hash represents basic info for a business

@ids = @businesses.map { |business| business[:id] }
# takes the array of business hashes
# returns an array of just the id for each business
["1]

@detailed_info = @ids.map { |id| HTTParty.get("https://api.yelp.com/v3/businesses/#{id}") }

@detailed_info.map { |business| Restaurant.find_or_create_by(parse_business_info(business)) }

```

def parse_business_info(info_hash)
  hash = {
  name: info_hash[:name],
  image_link: info_hash[:image_url]

  }
end 