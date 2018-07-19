class CreateStations < ActiveRecord::Migration[5.2]
  def change
    create_table :stations do |t|
      t.references :system, foreign_key: true
      t.string :name
      t.string :construction
      t.float :distance_from_star_ls

      t.timestamps
    end
  end
end
