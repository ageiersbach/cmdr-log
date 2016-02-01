class SoldItemsController < ApplicationController
  # takes params from a multi-model form and updates a
  # collection of StoredCommodities that are sold together
  def create
    @updater = StoringCommodities.updater(params)
    if @updater.valid?
      @updater.update
      current_commander.update(balance: @updater.new_balance(current_commander.balance))
    end

    redirect_to cmdr_ship_path(current_commander, current_ship)
  end
end
