class ExtractedResourcesController < ApplicationController

  def create
    @extracted_resource = ExtractedResource.create(extracted_resources_params)
    @extracted_resource.ship = current_ship
    if @extracted_resource.save
      entry = MiningEntryPresenter.new(@extracted_resource.entry)
      render partial: '/shared/mining_entry',
      locals: { mining_entry: entry } and return
    else
      render @extracted_resource.errors.to_json, status: :unprocessable_entity and return
    end
  end

  def destroy
  end

  private

  def extracted_resources_params
    params.require(:extracted_resource).permit(:entry_id, :commodity_id)
  end
end
