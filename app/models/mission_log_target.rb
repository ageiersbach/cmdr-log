class MissionLogTarget < ApplicationRecord
  belongs_to :station
  belongs_to :mission_log
  has_one :target_commodity, dependent: :destroy
end
