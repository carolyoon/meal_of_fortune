get '/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :'searches/show'
end

