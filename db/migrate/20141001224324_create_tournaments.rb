class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.belongs_to :player
    end
  end
end
