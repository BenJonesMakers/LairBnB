require 'sinatra/base'
require './lib/space'

class LairBnB < Sinatra::Base

  get '/test' do
    'Hello World'
  end

  get '/spaces' do
    @space = Space.all
    erb :spaces
  end

  post '/spaces' do
    Space.add(params[:name], params[:startdate])
    redirect '/spaces'
  end

  get '/spaces/new' do
    erb :new
  end

  run! if app_file == $0
end
