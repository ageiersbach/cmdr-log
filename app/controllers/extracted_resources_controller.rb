class ExtractedResourcesController < ApplicationController

  def create
    @extracted_resource = ExtractedResource.where(extracted_resources_params).first_or_initialize
    @extracted_resource.quantity += 1 unless @extracted_resource.new_record?
    @extracted_resource.ship = current_ship
    if @extracted_resource.save
      render partial: '/entries/mining_entry', locals: { entry: @extracted_resource.entry } and return
    else
      render @extracted_resource.errors.to_json, status: :unprocessable_entity and return
    end
  end

  def destroy
  end

  private

  def extracted_resource
    @extracted_resource = ExtractedResource.where(entry_id: params[:entry_id],
                            commodity_id: params[:commodity_id]).first_or_initialize
  end

  def extracted_resources_params
    params.require(:extracted_resource).permit(:entry_id, :commodity_id)
  end
end
