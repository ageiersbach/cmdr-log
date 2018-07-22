class Commander < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :location, polymorphic: true
  has_many :cargo_items
  has_many :missions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  after_initialize :set_default_location

  def star_system
    location_type == "StarSystem" ? location : location.star_system
  end

  private

  def set_default_location
    if !location
      self.location = StarSystem.where(name: 'Sol', x: 0.0, y: 0.0, z: 0.0).first_or_create
    end
  end
end
