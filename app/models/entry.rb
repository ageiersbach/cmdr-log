class Entry < ActiveRecord::Base
  belongs_to :cmdr
  belongs_to :system_object
  has_many :extracted_resources

  enum activity: [:mine, :trade, :travel]
  scope :reverse_cron, -> { order(created_at: :desc) }

  validates :activity, :cmdr, :system_object, presence: true
end
