module RPS
  class Player < ActiveRecord::Base
    # has_many :games
    has_many :tournaments

    def games
      Game.where(player_1_id: self.id) | Game.where(player_2_id: self.id)
    end
  end
end