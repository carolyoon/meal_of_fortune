get '/' do 
  @cuisine = Cuisine.find_by(name: "Chinese")
  ids = YelpSearchAdapter.search("chinese", "Oakland")
  @restaurants = ids.map { |id| @cuisine.restaurants.find_or_create_by(YelpBusinessAdapter.search(id)) }
end 

#Cuisine.find_by(name: params[:name])
#search(params[:name], params[:location])