module EntriesHelper

  def create_extracted_resource(commodity, entry)
    extracted_resources_path(extracted_resource: {
      commodity_id: commodity.id,
      entry_id: entry.id
    })
  end

  def mark_entry_done_button(commander, entry)
    cmdr_entry_path(commander, entry, entry: {
      is_closed: true
    })
  end
end
