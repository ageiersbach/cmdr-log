class CreateSystemObjects < ActiveRecord::Migration
  def change
    create_table :system_objects do |t|
      t.references :system, index: true, foreign_key: true
      t.string :name
      t.integer :object_type

      t.timestamps null: false
    end
  end
end
