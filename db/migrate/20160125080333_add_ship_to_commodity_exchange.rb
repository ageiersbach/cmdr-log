class AddShipToCommodityExchange < ActiveRecord::Migration
  def change
    add_reference :commodity_exchanges, :ship, index: true, foreign_key: true
  end
end
