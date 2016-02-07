class Entry < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :activity
  belongs_to :cmdr
  belongs_to :note
  belongs_to :system_object
  has_many :extracted_resources

  delegate :template, to: :activity, prefix: true
  scope :reverse_cron, -> { order(created_at: :desc) }

  validates :activity, :cmdr, :system_object, presence: true

  def as_presenter
    activity.presenter.new(self)
  end
end
