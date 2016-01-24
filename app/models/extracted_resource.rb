class ExtractedResource < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :mining_entry

  validates :commodity, :mining_entry, presence: true
  validate :is_mineable

  delegate :category, to: :commodity, prefix: true, allow_nil: true

  private

  def is_mineable
    unless ["minerals", "metals"].include?(commodity_category)
      errors.add(:commodity, "can only extract minerals and metals")
    end
  end
end
