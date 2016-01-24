class Ship < ActiveRecord::Base
  belongs_to :cmdr
  validates :model, presence: true
end
