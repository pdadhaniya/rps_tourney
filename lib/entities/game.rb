module RPS
  class Game < ActiveRecord::Base
    belongs_to :player_1, class_name: "Player"
    belongs_to :player_2, class_name: "Player"
    belongs_to :winner, class_name: "Player"
    belongs_to :tournament
  end
end