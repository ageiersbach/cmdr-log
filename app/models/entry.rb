class Entry < ActiveRecord::Base
  belongs_to :cmdr
  belongs_to :system_object

  enum activity: [:mine, :trade, :travel]

  validates :activity, :cmdr, :system_object, presence: true
end
