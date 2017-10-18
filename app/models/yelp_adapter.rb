class YelpAdapter

  include HTTParty 

  MAX_YELP_SCRAPE = 10

  base_uri "api.yelp.com/v3/businesses/search"

  headers        Authorization: "Bearer #{ENV['YELP_API_KEY']}"

  default_params limit: MAX_YELP_SCRAPE,
                 open_now: true

  def self.search(cuisine, location)
    response = self.get('', query: { categories: "restaurants, #{cuisine}",
                          location: location })['businesses']
  end 

  



end