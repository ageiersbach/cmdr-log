class CreateCargoItems < ActiveRecord::Migration
  def change
    create_table :cargo_items do |t|
      t.references :commodity, index: true, foreign_key: true
      t.references :cmdr, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
