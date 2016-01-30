class ExtractedResource < StoredCommodity
  delegate :name, to: :commodity, prefix: true
end
