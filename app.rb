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
    @lair = Space.specific_space(params[:id])
    @available_days = @lair.availability(11, 2020)
    if @available_days == []
      p "no availabe days found for #{@lair.name}"
    end
    erb :pick_a_date
  end

  run! if app_file == $0
end
