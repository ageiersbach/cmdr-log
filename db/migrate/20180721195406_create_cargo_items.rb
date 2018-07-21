class CreateCargoItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cargo_items do |t|
      t.references :commander, foreign_key: true
      t.references :commodity, foreign_key: true

      t.timestamps
    end
  end
end
