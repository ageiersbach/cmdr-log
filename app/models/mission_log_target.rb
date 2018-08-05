class MissionLogTarget < ApplicationRecord
  belongs_to :station
  belongs_to :mission_log
end
