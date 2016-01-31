# Homepage (Root path)

enable :sessions

QUESTIONS = [
  {id: 1, score: 10},
  {id: 2, score: 10},
  {id: 3, score: 10},
  {id: 4, score: 20},
  {id: 5, score: 10},
  {id: 6, score: 15, bonus: 10},
  {id: 7, score: 10},
  {id: 8, score: 15}
]

helpers do
  def next_question(which)
    path = '/question/'
    text = 'Question '
    if session[:question_id] < QUESTIONS.size
      next_number = (session[:question_id] + 1).to_s
      path << next_number
      text << next_number
    else
      path = '/fin'
      text = 'Fin'
    end

    which == 'path' ? path : text
  end

  def get_question(id)
    QUESTIONS[id - 1]
  end

  def question_points(question)
    points = "(#{question[:score]} points"
    points += " + #{question[:bonus]} bonus" if question[:bonus]
    points += ")"
    points
  end

  def total_points
    QUESTIONS.inject(0) { |total, question| total + question[:score] }
  end

  def bonus
    QUESTIONS.inject(0) { |total, question| total + (question[:bonus] ? question[:bonus] : 0) }
  end

  def total_with_bonus
    total_points + bonus
  end

end

get '/' do
  @title = "JS Assessment Test"
  @question = {id: 0, score: 0}
  session[:question_id] = 0
  erb :index
end

get '/question/:id' do
  @title = "JS Assessment Test - Question #{params[:id]}"
  @question = get_question(params[:id].to_i)
  session[:question_id] = @question[:id]
  erb :"question#{@question[:id]}"
end

get '/fin' do
  @title = "JS Assessment Test - You Finished!"
  @question = {id: 0, score: 0}
  erb :fin
end

get '/products' do
  products = [{name: "Widgets", price: 1.23, qty: 3}, {name: "Whizbangs", price: 2.34, qty: 10}, {name: "Whatchamacallits", price: 3.45, qty: 22}]
  products.to_json
end

