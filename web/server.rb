require 'sinatra/base'
require_relative '../lib/tourney.rb'
require 'pry-byebug'

class RPS::Server < Sinatra::Application

set :bind, '0.0.0.0'

  get '/' do
    erb :index
  end

  get '/players' do
    @players = RPS::Player.all
    erb :players
  end

  get '/games' do
    @games = RPS::Game.all
    erb :games
  end

  post '/players' do
    RPS::Player.create(name: params["player-name"], email: params["player-email"], password: params["player-password"])
    redirect to('/players')
  end






end