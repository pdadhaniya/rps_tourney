class ChangeTournamentsColumn < ActiveRecord::Migration
  def change
    rename_column :games, :tournaments_id, :tournament_id
  end
end
