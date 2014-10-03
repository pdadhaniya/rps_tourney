require 'digest'
module RPS
  class Player < ActiveRecord::Base
    # has_many :games
    has_many :tournaments

    def games
      Game.where(player_1_id: self.id) | Game.where(player_2_id: self.id)
    end

    def self.encrypt_password(pwd)
      Digest::SHA2.hexdigest(pwd)
    end

    def validate_password(pwd)
      self.password == Digest::SHA2.hexdigest(pwd)
    end
  end
end