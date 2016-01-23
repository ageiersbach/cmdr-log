class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name
      t.integer :galactic_average
      t.integer :category

      t.timestamps null: false
    end
  end
end
