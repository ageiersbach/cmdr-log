class CreateLocationLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :location_logs do |t|
      t.references :commander, foreign_key: true
      t.references :location, polymorphic: true, index: true
      t.datetime :timestamp

      t.timestamps
    end
  end
end
