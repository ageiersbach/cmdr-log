class DropMissions < ActiveRecord::Migration[5.2]

  def up
    drop_table :mission_targets
    drop_table :missions
  end

  def down
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

    create_table :mission_targets do |t|
      t.references :cargo_item, foreign_key: true
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
