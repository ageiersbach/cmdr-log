class MissionTarget < ApplicationRecord
  belongs_to :cargo_item
  belongs_to :mission
end
