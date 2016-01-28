class MiningEntryPresenter
  # usage
  # @mining_entry = MiningEntryPresenter.new(entry)
  # @mining_entry.descriptive_heading (# "Mining@Guathiti6" / "Mined@Guathiti6" )
  # @mining_entry.extracted_resources.each do |resource|
  #   %li
  #     = resource.amount_extracted
  #     = resource.name
  #     = link_to "X", extracted_resources_path(resource.last_id)

  def initialize(entry)
    @entry = entry
  end

  def descriptive_heading
    @entry.is_closed? ? "Mined @ #{mining_location}" : "Mining @ #{mining_location}"
  end

  def extracted_resources
    @entry.extracted_resources
      .joins(:commodity)
      .select('commodities.name as name')
      .select('count(commodity_id) as amount_extracted')
      .select(:commodity_id)
      .group(:commodity_id)
  end

  private

  def mining_location
    @entry.system_object.name
  end
end
