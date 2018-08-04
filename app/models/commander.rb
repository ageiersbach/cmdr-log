class Commander < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :location, polymorphic: true
  has_many :cargo_items
  has_many :missions
  has_secure_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  after_initialize :set_default_location

  def star_system
    location_type == "StarSystem" ? location : location.star_system
  end

  def active_token?
    token && Time.now.utc < token_expiration
  end

  # overrides Rails method provided by `has_secure_token` to
  # simultaneously set the token token_expiration
  def regenerate_token
    update!(token: self.class.generate_unique_secure_token,
            token_expiration: Time.now.utc + 1.day)
  end

  private

  def set_default_location
    if !location
      self.location = StarSystem.where(name: 'Sol', x: 0.0, y: 0.0, z: 0.0).first_or_create
    end
  end
end
