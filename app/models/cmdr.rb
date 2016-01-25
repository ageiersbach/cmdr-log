class Cmdr < ActiveRecord::Base
  validates :name, presence: true
  has_many :entries
end
