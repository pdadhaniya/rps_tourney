class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :player_1
      t.references :player_2
      t.belongs_to :tournaments
      t.string :move1
      t.string :move2
      t.references :winner
    end
  end
end
