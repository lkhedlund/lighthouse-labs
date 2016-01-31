# Homepage (Root path)

enable :sessions

helpers do
	def next_question(which) 
		path = '/question/'
		text = 'Question '
		if session[:question_id] < Question.all.count
			next_number = (session[:question_id] + 1).to_s
			path << next_number
			text << next_number
		else
			path = '/fin'
			text = 'Fin'
		end

		which == 'path' ? path : text
	end

end

get '/' do
	@title = "JS Assessment Test"
	@question = {id: 0, score: 0}
	session[:question_id] = 0
	@questions = Question.all
  erb :index
end

get '/question/:id' do
	@title = "JS Assessment Test - Question #{params[:id]}"
	@question = Question.find(params[:id])
	session[:question_id] = @question[:id]
	erb :"question#{@question[:id]}"
end

get '/fin' do
	@title = "JS Assessment Test - You Finished!"
	@question = {id: 0, score: 0}
	erb :fin
end
