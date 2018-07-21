class Commander < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :location, polymorphic: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  def star_system
    location_type == "StarSystem" ? location : location.star_system
  end
end
