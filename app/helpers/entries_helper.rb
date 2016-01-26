module EntriesHelper

  def create_extracted_resource(commodity, entry)
    extracted_resources_path(extracted_resource: {
      commodity_id: commodity.id,
      entry_id: entry.id
    })
  end
end
