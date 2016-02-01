class ShipsController < ApplicationController
  def show
    @ship = Ship.find(params[:id])
    @cargo_items = CargoItemsPresenter.new(@ship)
  end
end
