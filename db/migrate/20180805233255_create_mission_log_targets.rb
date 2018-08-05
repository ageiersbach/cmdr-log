class CreateMissionLogTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_log_targets do |t|
      t.datetime :expiration
      t.references :station, foreign_key: true
      t.references :mission_log, foreign_key: true

      t.timestamps
    end
  end
end
