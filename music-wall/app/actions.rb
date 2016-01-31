# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  session['song_review'] = nil
  if session['user']
    @songs = Song.all
    erb :'songs/index'
  else
    redirect '/'
  end
end

get '/songs/new' do
  if session['user']
    @song = Song.new
    erb :'songs/new'
  else
    redirect '/'
  end
end

get '/songs/review' do
  session['song_review'] ||= params[:song_id]
  if session['user']
    @song = Song.find(session['song_review'])
    @reviews = @song.reviews.order('updated_at desc')
    @rating = @song.reviews.average(:rating).to_i
    erb :'songs/reviews'
  else
    redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.password == params[:password]
    session['user'] = user.id
    redirect "/songs"
  else
    redirect "/"
  end
end

post '/votes' do
  user = User.find(session['user'])
  double_vote = Upvote.where(song_id: params[:song_id], user_id: user.id) if user
  if double_vote.empty?
    Upvote.create(
      song_id: params[:song_id],
      user_id: user.id
    )
    redirect '/songs'
  else
    redirect '/songs'
  end
end

post '/songs' do
  song = Song.new(
    title: params[:title].upcase,
    artist: params[:artist].upcase,
    url: params[:url]
  )
  if song.save
    redirect '/songs'
  else
    erb :'songs/new'
  end
end

post '/review' do
  review = Review.new(
    user_id: session['user'],
    song_id: params[:song_id],
    content: params[:content],
    rating: params[:rating]
  )
  review.save
  redirect '/songs/review'
end

post '/delete-review' do
  @review = Review.find(params[:review_id])
  @review.destroy
  @review.save
  redirect '/songs/review'
end
