#TODO: copypasta w/ MiningEntryPresenter. Figure out how to combine
class CargoItemsPresenter
  def initialize(ship)
    @ship = ship
  end

  def estimated_value
    cargo_items.map(&:sum_galactic_average).inject(0, :+)
  end


  def total_cargo
    cargo_items.map(&:amount).inject(0, :+)
  end


  def cargo_items
    @ship.cargo_items
      .joins(:commodity)
      .select('min(stored_commodities.id) as id') # ?? will this work
      .select('commodities.name as name')
      .select(:ship_id, :commodity_id)
      .select('count(commodity_id) as amount')
      .select('sum(commodities.galactic_average) as sum_galactic_average')
      .group(:commodity_id)
  end
end
