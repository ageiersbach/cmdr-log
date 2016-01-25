class Cmdr < ActiveRecord::Base
  validates :name, presence: true
  has_many :entries
  has_many :ships
  accepts_nested_attributes_for :ships
end
