class CreateMissions < ActiveRecord::Migration[5.2]
  def change
    create_table :missions do |t|
      t.references :commander, foreign_key: true
      t.references :commodity, foreign_key: true
      t.references :station, foreign_key: true
      t.string :name
      t.datetime :expires_at
      t.integer :reward
      t.integer :target
      t.integer :game_mission_id
      t.boolean :wing, default: false

      t.timestamps
    end
  end
end
