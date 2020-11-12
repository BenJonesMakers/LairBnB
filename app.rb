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
    # @id = params[:id]
    @lair = Space.specific_space(params[:id])
    erb :pick_a_date
  end

  run! if app_file == $0
end
