class Ship < ActiveRecord::Base
  belongs_to :cmdr
  has_many :cargo_items, class_name: 'StoredCommodity'
  validates :model, presence: true
end
