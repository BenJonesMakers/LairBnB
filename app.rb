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

  post '/' do
    redirect '/user/new'
  end

  get '/user/new' do
    erb (:'user/new')
  end

  get '/login' do
    erb (:'user/login')
  end

  post '/login' do
    if User.verification(params[:email], params[:password]) == false
     flash[:notice] = "ERROR! Try re-enter email or password."
     redirect '/login'
    else
      redirect '/homepage'
    end
  end
  # user = User.verification(params[:email], params[:password])
  # session[:user_id] = user.id
  # prob need SESSION thing also to keep track

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
  # this page will have buttons to use the web

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

  run! if app_file == $0
end
