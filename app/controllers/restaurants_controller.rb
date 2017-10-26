get '/restaurant/:id' do
  @restaurant = Restaurant.find(params[:id])
  erb :'searches/show'
end
