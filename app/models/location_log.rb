class LocationLog < ApplicationRecord
  belongs_to :commander
  belongs_to :location, polymorphic: true

  def star_system
    location_type == "StarSystem" ? location : location.star_system
  end
end
