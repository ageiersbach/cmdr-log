class RemoveCargoItems < ActiveRecord::Migration[5.2]
  def up
    drop_table :cargo_items
  end

  def down
    create_table :cargo_items do |t|
      t.references :commander, foreign_key: true
      t.references :commodity, foreign_key: true

      t.timestamps
    end
  end
end
