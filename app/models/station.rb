class Station < ApplicationRecord
  belongs_to :star_system
  validates :name, presence: true
end
