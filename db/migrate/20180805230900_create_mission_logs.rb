class CreateMissionLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_logs do |t|
      t.datetime :timestamp
      t.string :description
      t.integer :ed_mission_id
      t.references :commander

      t.timestamps
    end
  end
end
