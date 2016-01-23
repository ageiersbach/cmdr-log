class Cmdr < ActiveRecord::Base
  validates :name, presence: true
end
