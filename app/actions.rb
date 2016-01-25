# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  redirect_if_not_authenticated
  @track = Track.new
  erb :'tracks/new'
end

post '/tracks/new' do
  redirect_if_not_authenticated
  url = params[:url] == "" ? nil : params[:url]
  url_text = params[:url_text] == "" ? nil : params[:url_text]
  @track = Track.new(
    title: params[:title],
    author: params[:author],
    url: url,
    url_text: url_text,
    user: User.find(session[:user_id])
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end

get '/sessions/register' do
  @user = User.new
  erb :'sessions/register'
end

post '/sessions/register' do
  @user = User.new(
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation]
  )

  if @user.save
    session["user_id"] ||= @user.id
    redirect '/tracks'
  else
    redirect '/sessions/register'
  end
end

get '/sessions/login' do
  @user = User.new
  erb :'sessions/login'
end

post '/sessions/login' do
  user = User.find_by_username(params[:username])
  if user && user.authenticate(params[:password])
    session["user_id"] ||= user.id
    redirect '/tracks'
  else
    redirect '/sessions/not-found'
  end
end

get '/sessions/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/sessions/not-found' do
  erb :'sessions/not_found'
end

def user_authenticated?
  !session["user_id"].nil?
end

def redirect_if_not_authenticated
  redirect '/sessions/login' unless user_authenticated?
end
