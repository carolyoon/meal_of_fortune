get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.authenticate(params[:username], params[:password])
  if @user
    login(@user)
  else
    @errors = ["Invalid username or password"]
    erb :'sessions/new'
  end
end
