class TargetCommodity < ApplicationRecord
  belongs_to :commodity
  belongs_to :mission_log_target
  validates :count, numericality: { greater_than: 0 }
end
