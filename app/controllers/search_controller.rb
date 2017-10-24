get '/search' do
  @cuisine = Cuisine.find_by(name: params[:cuisine])
  ids = YelpSearchAdapter.search(params[:cuisine], params[:location])
  @restaurants = ids.map { |id| @cuisine.restaurants.find_or_create_by(YelpBusinessAdapter.search(id)) }
  erb :'searches/results'
end

post '/search' do
  @cuisine = Cuisine.spin_wheel
  @location = params[:location]
  redirect "/search?cuisine=#{@cuisine}&location=#{@location}"
end

#Cuisine.find_by(name: params[:name])
#search(params[:name], params[:location])

# mealoffortune.com/search?cuisine=#{@cuisine}&location={@location}
