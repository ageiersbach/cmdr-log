class CreateCommodityExchanges < ActiveRecord::Migration
  def change
    create_table :commodity_exchanges do |t|
      t.references :commodity, index: true, foreign_key: true
      t.references :entry, index: true, foreign_key: true
      t.integer :price
      t.integer :quantity

      t.string :type, null: false

      t.timestamps null: false
    end
  end
end
