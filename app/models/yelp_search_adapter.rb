class YelpSearchAdapter

  include HTTParty 

  MAX_YELP_SCRAPE = 3

  base_uri "api.yelp.com/v3/businesses/search"

  headers        Authorization: "Bearer #{ENV['YELP_API_KEY']}"

  default_params limit: MAX_YELP_SCRAPE,
                 open_now: true, 
                 term: "restaurants"

  def self.search(cuisine, location)
    businesses = self.get('', query: { categories: "#{cuisine}",
                          location: location })['businesses']
    retrieve_ids(businesses)
  end 

  # def self.parse(restaurant)
  #   restaurant_details = {
  #     name: restaurant["name"],
  #     image_url: restaurant["image_url"],
  #     url: restaurant["url"],
  #     address: restaurant["location"]["address1"],
  #     hours: 
  #     rating:
  #     price: 
  #   }


  # end 

  private 

  def self.retrieve_ids(businesses)
    businesses.map! { |business| business["id"] }
  end 



end