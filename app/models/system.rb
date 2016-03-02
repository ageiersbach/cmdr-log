class System < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: [:x, :y, :z] }
end
