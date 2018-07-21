class CreateMissionTargets < ActiveRecord::Migration[5.2]
  def change
    create_table :mission_targets do |t|
      t.references :cargo_item, foreign_key: true
      t.references :mission, foreign_key: true

      t.timestamps
    end
  end
end
