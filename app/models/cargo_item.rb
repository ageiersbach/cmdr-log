class CargoItem < ApplicationRecord
  belongs_to :commander
  belongs_to :commodity
end
