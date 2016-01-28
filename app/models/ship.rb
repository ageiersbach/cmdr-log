class Ship < ActiveRecord::Base
  belongs_to :cmdr
  has_many :cargo_items, class_name: 'CommodityExchange'
  validates :model, presence: true
end
