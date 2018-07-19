class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :name
      t.float :x
      t.float :y
      t.float :z

      t.timestamps
    end
  end
end
