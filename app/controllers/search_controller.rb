get '/search' do
  @cuisine = Cuisine.find_by(name: params[:cuisine])
  #@coordinates = GooglePlacesAdapter.search_location(params[:location])
  ids = YelpSearchAdapter.search(@cuisine.yelp_search_term, params[:location])
  @restaurants = ids.map { |id| @cuisine.restaurants.find_or_create_by(YelpBusinessAdapter.search(id)) }
  erb :'searches/results'
end

post '/search' do
  degrees = rand(360)
  @cuisine = Cuisine.spin_wheel(degrees)
  @location = params[:location]
  if request.xhr?
    content_type :json
    { degrees: degrees, location: @location, cuisine: @cuisine }.to_json
  else
    redirect "/search?cuisine=#{@cuisine}&location=#{@location}"
  end
end


#Cuisine.find_by(name: params[:name])
#search(params[:name], params[:location])

# mealoffortune.com/search?cuisine=#{@cuisine}&location={@location}


