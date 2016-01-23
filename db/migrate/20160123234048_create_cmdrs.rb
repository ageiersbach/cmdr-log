class CreateCmdrs < ActiveRecord::Migration
  def change
    create_table :cmdrs do |t|
      t.string :name
      t.integer :balance

      t.timestamps null: false
    end
  end
end
