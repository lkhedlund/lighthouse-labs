# Basic Sinatra style actions.rb

get '/' do
  erb :index
end

get '/results' do
  content_type :json

  @contacts = Contact.all
  unless params[:search_term].blank?
    term = "%#{params[:search_term]}%"
    @contacts = @contacts.where('name LIKE :term', { term: term })
  end

  @contacts.to_json
end

get '/contacts' do
  content_type :json
  # @contacts = Contact.all.order('created_at desc')
  @contacts = Contact.all

  @contacts.to_json
end

post '/contacts' do
  content_type :json

  @contact = Contact.new(
    firstname: params[:firstname],
    lastname: params[:lastname],
    email: params[:email]
  )

  if @contact.save
    @contact.to_json
  else
    halt 500
  end
end

put '/contacts/:id' do
  content_type :json

  @contact = Contact.find(params[:id])
  @contact.update_attributes(
    firstname: params[:firstname],
    lastname: params[:lastname],
    email: params[:email]
  )

  if @contact.save
    @contact.to_json
  else
    halt 500
  end
end


delete '/contacts/:id' do
  content_type :json

  @contact.find(params[:id])

  if @contact.destroy
    @contact.to_json
  else
    halt 500
  end
end
