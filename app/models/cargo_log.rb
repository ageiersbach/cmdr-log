class CargoLog < ApplicationRecord
  belongs_to :commodity
  belongs_to :commander
end
