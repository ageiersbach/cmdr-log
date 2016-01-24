class ExtractedResource < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :mining_entry

  validates :commodity, :mining_entry, presence: true
end
