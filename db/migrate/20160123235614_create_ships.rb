class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.references :cmdr, index: true, foreign_key: true
      t.boolean :is_current, default: false
      t.string :model
      t.integer :cargo_capacity

      t.timestamps null: false
    end
  end
end
