class SystemObject < ActiveRecord::Base
  belongs_to :system
  validates :name, presence: true

  enum object_type: [:planet, :satellite, :asteroid_belt, :station]
end
