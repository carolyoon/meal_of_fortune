class YelpBusinessAdapter

  include HTTParty

  base_uri "api.yelp.com/v3/businesses"

  headers     Authorization: "Bearer #{ENV['YELP_API_KEY']}"

  def self.search(id)
    response = self.get("/#{id}", {})
    parse_business_data(response)
  end

  private 

  def self.parse_business_data(response)
    business_details = {
      name: response["name"],
      image_url: response["image_url"],
      url: response["url"],
      address: response["location"]["display_address"][0],
      rating: response["rating"],
      price: response["price"]
    }
  end 

end 

