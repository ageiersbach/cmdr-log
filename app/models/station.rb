class Station < ApplicationRecord
  belongs_to :system
  validates :name, :system, presence: true
end
