class PurchasedCommodity < CommodityExchange
  validates :price, :quantity, presence: true
end
