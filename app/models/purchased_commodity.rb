class PurchasedCommodity < StoredCommodity
  validates :price, :quantity, presence: true
end
