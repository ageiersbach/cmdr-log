class MissionLog < ApplicationRecord
  belongs_to :commander
  has_one :mission_log_target
end
