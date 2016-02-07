class ExtractedResourcesController < ApplicationController

  def create
    @extracted_resource = ExtractedResource.create(extracted_resources_params)
    @extracted_resource.ship = current_ship
    if @extracted_resource.save
      render partial: @extracted_resource.entry.activity_template,
      locals: { presenter: @extracted_resource.entry.as_presenter } and return
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
