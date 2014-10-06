require 'sinatra/base'
require_relative '../lib/tourney.rb'
require 'pry-byebug'
require 'digest/sha2'
require 'rock_pape_scis'

class RPS::Server < Sinatra::Application

  configure do 
    set :bind, '0.0.0.0'
    enable :sessions
  end

  get '/' do
    if session[:player_id]
      erb :index
    else
      redirect to('/login')
    end
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
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

  post '/sessions' do
    player = RPS::Player.find_by(name: params[:name])
    if player.validate_password(params[:password])
      session[:player_id] = player.id
    end
    redirect to('/')
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

  post '/games/:id' do
    @game = RPS::Game.find(params[:id])
    @game.move1 = params["move-player1"]
    @game.move2 = params["move-player2"]
    if @game.move1 != @game.move2
      @result = RockPapeScis.play({name: (@game.player_1).name, move: @game.move1}, {name: (@game.player_2).name, move: @game.move2})
      @winner = (RPS::Player.find_by name: @result).id
      @game.winner_id = @winner
      @game.save
      redirect to("/games/#{@game.id}")
    end
  end

  delete '/logout' do
      session[:player_id] = nil
      redirect to('/')
    end


end