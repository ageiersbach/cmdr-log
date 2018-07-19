class System < ApplicationRecord
  validates :name, :x, :y, :z, presence: true
end
