class Mission < ApplicationRecord
  belongs_to :commander
  belongs_to :commodity
  belongs_to :station

  validates :expires_at, :target, :game_mission_id, presence: true
  validates :target, numericality: { greater_than: 0 }
end
