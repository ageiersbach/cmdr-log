class ExtractedResourcesController < ApplicationController

  def create
    @extracted_resource = ExtractedResource.new(extracted_resources_params)
    if @extracted_resource.save
      render partial: 'entries/mining_entry', entry: @extracted_resource.entry
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
