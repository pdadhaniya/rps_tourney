module RPS
  class Tournament < ActiveRecord::Base
    has_many :games
    belongs_to :player, class_name: "Player"
  end
end