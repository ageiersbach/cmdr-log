class AddSellPriceToStoredCommodity < ActiveRecord::Migration
  def change
    add_column :stored_commodities, :sell_price, :integer
    rename_column :stored_commodities, :price, :buy_price
    remove_column :stored_commodities, :quantity, :integer
  end
end
