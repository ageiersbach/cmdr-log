class StoredCommoditiesController < ApplicationController
  def update
    redirect_to cmdr_ship_path(current_commander, current_ship)
  end
end
