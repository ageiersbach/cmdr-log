class Commander < ApplicationRecord
  has_many :cargo_logs
  has_many :location_logs
  has_many :mission_logs
  has_secure_token

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true

  def active_token?
    token && Time.now.utc < token_expiration
  end

  # overrides Rails method provided by `has_secure_token` to
  # simultaneously set the token token_expiration
  def regenerate_token
    update!(token: self.class.generate_unique_secure_token,
            token_expiration: Time.now.utc + 1.day)
  end
end
