require 'sinatra/base'
require 'sinatra/flash'
require './lib/space'
require './lib/user'

class LairBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/test' do
    'Hello World'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user/new' do
    erb :'user/new'
  end

  get '/login' do
    erb :'user/login'
  end

  post '/login' do
    if User.verification(params[:email], params[:password]) == false
      flash[:notice] = "ERROR! Try re-enter email or password."
      redirect '/login'
    else
      user = User.verification(params[:email], params[:password])
      session[:id] = user.id
      redirect '/homepage'
    end
  end

  get '/logout' do
    erb :'user/logout'
  end

  delete '/logout' do
    flash[:notice] = "You are logged out now" # doesnt work
    session.delete(:id)
    redirect '/user/new'
  end

  post '/user' do
    User.create(params[:email], params[:password])
    if User.confirmation(params[:password], params[:password_confirmation]) == true
      redirect '/homepage'
    else
      flash[:notice] = "Confirm your password again."
      redirect 'user/new'
    end
  end

  get '/homepage' do
    erb :homepage
  end

  get '/spaces' do
    @space = Space.all
    erb :spaces
  end

  post '/spaces' do
    Space.add(name: params[:name],
              description: params[:description],
              price: params[:price],
              startdate: params[:startdate],
              enddate: params[:enddate])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new
  end

  post '/spaces/pick_a_date' do
    @lair = Space.specific_space(params[:id])
    @available_days = @lair.availability(11, 2020)
    erb :pick_a_date
  end

  post '/space/request_lair' do
    p params
    erb :requests
  end

  run! if app_file == $0
end
