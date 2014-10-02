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

  get '/tournaments' do
    @tournaments = RPS::Tournament.all
    erb :tournaments
  end

  get '/tournaments/new' do
    @players = RPS::Player.all
    erb :new_tournament
  end

  post '/players' do
    RPS::Player.create(name: params["player-name"], email: params["player-email"], password: params["player-password"])
    redirect to('/players')
  end

  get '/tournaments/:id' do
    @games = RPS::Game.all
    @tournament = RPS::Tournament.find(params[:id])
    erb :one_tournament
  end




end