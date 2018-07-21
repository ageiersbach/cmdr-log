class CargoItem < ApplicationRecord
  belongs_to :commander
  belongs_to :commodity
  has_one :mission_target
end
