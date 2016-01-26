class ExtractedResource < CommodityExchange
  validates :quantity, presence: true
  after_initialize :set_quantity_to_one, if: :new_record?
  delegate :name, to: :commodity, prefix: true

  private

  def set_quantity_to_one
    unless quantity
      self.quantity = 1
    end
  end
end
