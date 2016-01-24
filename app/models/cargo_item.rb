class CargoItem < ActiveRecord::Base
  belongs_to :commodity
  belongs_to :cmdr

  validates :commodity, :cmdr, presence: true
end
