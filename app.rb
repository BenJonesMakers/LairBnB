require 'sinatra/base'
require './lib/space'

class LairBnB < Sinatra::Base

  get '/test' do
    'Hello World'
  end

  get '/user/new' do
    erb (:'user/new')
  end

  post '/user' do
    redirect '/homepage'
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
