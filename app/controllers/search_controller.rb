get '/' do 
  # ap results = YelpSearchAdapter.search("chinese", "San Francisco")
  Restaurant.destroy_all
  @cuisine = Cuisine.find_by(name: "Chinese")
  ids = YelpSearchAdapter.search("chinese", "Oakland")
  @restaurants = ids.map { |id| @cuisine.restaurants.find_or_create_by(YelpBusinessAdapter.search(id)) }
end 