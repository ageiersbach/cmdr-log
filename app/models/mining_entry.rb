class MiningEntry < ActiveRecord::Base
  belongs_to :cmdr
  belongs_to :system_object

  validates :cmdr, :system_object, presence: true
end
