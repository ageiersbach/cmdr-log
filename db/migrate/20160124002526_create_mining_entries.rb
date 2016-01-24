class CreateMiningEntries < ActiveRecord::Migration
  def change
    create_table :mining_entries do |t|
      t.references :cmdr, index: true, foreign_key: true
      t.references :system_object, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
