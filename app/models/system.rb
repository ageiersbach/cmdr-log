class System < ActiveRecord::Base
  validates :name, presence: true
end
