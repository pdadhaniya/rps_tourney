require 'sinatra/base'
require_relative '../lib/tourney.rb'
require 'pry-byebug'
require 'digest/sha2'

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
    RPS::Player.create(name: params["player-name"], email: params["player-email"], password: Digest::SHA2.hexdigest(params["player-password"]))
    redirect to('/players')
  end

  get '/games/:id' do
    @game = RPS::Game.find(params[:id])
    erb :one_game
  end

  get '/tournaments/:id' do
    @games = RPS::Game.all
    @tournament = RPS::Tournament.find(params[:id])
    erb :one_tournament
  end

  post '/tournaments' do
    @new = RPS::Tournament.create
    RPS::Game.create(player_1_id: params["game-player1"], player_2_id: params["game-player2"], tournament_id: @new.id)
    RPS::Game.create(player_1_id: params["game-player3"], player_2_id: params["game-player4"], tournament_id: @new.id)
    RPS::Game.create(player_1_id: params["game-player5"], player_2_id: params["game-player6"], tournament_id: @new.id)
    RPS::Game.create(player_1_id: params["game-player7"], player_2_id: params["game-player8"], tournament_id: @new.id)
    redirect to("/tournaments/#{@new.id}")
  end



end