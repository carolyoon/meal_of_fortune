module GooglePlacesAdapter

  include HTTParty

  base_uri "maps.googleapis.com/maps/api/geocode/json"

  default_params key: ENV['GOOGLE_PLACES_API_KEY']

  def self.search_location(address)
    response = self.get("https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GOOGLE_PLACES_API_KEY']}&address=#{address}")
    # response = self.get('', query: { address: address } )
    parse_location_data(response)
  end

  private

  def self.parse_location_data(response)
    location = response["results"][0]["geometry"]["location"]
  end

end
