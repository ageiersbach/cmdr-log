class StarSystem < ApplicationRecord
  validates :name, :x, :y, :z, presence: true
end
