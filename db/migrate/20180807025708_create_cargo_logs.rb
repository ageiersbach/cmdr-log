class CreateCargoLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :cargo_logs do |t|
      t.datetime :timestamp
      t.references :commodity, foreign_key: true
      t.references :commander, foreign_key: true
      t.integer :count

      t.timestamps
    end
  end
end
