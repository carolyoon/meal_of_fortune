class YelpSearchAdapter

  include HTTParty

  MAX_YELP_SCRAPE = 3

  base_uri "api.yelp.com/v3/businesses/search"

  headers        Authorization: "Bearer #{ENV['YELP_API_KEY']}"

  default_params limit: MAX_YELP_SCRAPE,
                 open_now: true,
                 term: "restaurants"

  def self.search(cuisine, location)
    businesses = self.get('', query: { categories: cuisine,
                          location: location })['businesses']
    retrieve_ids(businesses)
  end

  private

  def self.retrieve_ids(businesses)
    businesses.map! { |business| business["id"] }
  end



end
