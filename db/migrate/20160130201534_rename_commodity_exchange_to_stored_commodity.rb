class RenameCommodityExchangeToStoredCommodity < ActiveRecord::Migration
  def up
    rename_table :commodity_exchanges, :stored_commodities
  end

  def down
    rename_table :stored_commodities, :commodity_exchanges
  end
end
