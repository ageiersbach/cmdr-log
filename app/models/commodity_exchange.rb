class CommodityExchange < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :entry

  validates :commodity, :entry, presence: true
end
