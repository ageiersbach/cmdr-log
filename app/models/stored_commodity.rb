class StoredCommodity < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :entry
  belongs_to :ship

  validates :commodity, :entry, presence: true
end
