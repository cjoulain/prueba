#show all users
get '/users' do
  @users = User.all
  erb :'/users/user_index'
end

#new user form
get '/users/new' do
  erb :'/users/user_new'
end

#create new user
post '/users' do
  user = User.new(username: params[:username], email: params[:email])
  user.password = params[:password]
  if user.save
    session[:id] = user.id
    redirect '/'
  else
    status 400
    flash[:errors] = user.errors.full_messages
    redirect '/users/new'
  end
end
