# Homepage (Root path)
get '/' do
  erb :index
end

get '/tracks' do
  @tracks = Track.all
  erb :'tracks/index'
end

get '/tracks/new' do
  @track = Track.new
  erb :'tracks/new'
end

post '/tracks/new' do
  url = params[:url] == "" ? nil : params[:url]
  @track = Track.new(
    title: params[:title],
    author: params[:author],
    url: url,
    url_text: params[:url_text]
  )
  if @track.save
    redirect '/tracks'
  else
    erb :'tracks/new'
  end
end
