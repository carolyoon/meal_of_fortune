post '/restaurants/:restaurant_id/favorites' do
  @restaurant = Restaurant.find(params[:restaurant_id])
  if logged_in? && !current_user.favorited_restaurants.include?(@restaurant)
    Favorite.create(user: current_user, restaurant: @restaurant)
  end
  redirect "/restaurants/#{@restaurant.id}"
end
