class PurchasedCommodity < StoredCommodity
  validates :buy_price, presence: true
end
