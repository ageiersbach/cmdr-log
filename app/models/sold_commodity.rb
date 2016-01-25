class SoldCommodity < CommodityExchange
  validates :price, :quantity, presence: true
end
