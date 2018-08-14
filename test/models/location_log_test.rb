require 'test_helper'

class LocationLogTest < ActiveSupport::TestCase
  test "validations" do
    location = LocationLog.new
    assert !location.valid?

    location.commander = commanders(:one)
    location.location = star_systems(:one)

    assert location.valid?
  end

  test "star_system" do
    l = location_logs(:one)
    assert_equal(l.star_system, star_systems(:one))

    l.location = stations(:two)

    assert_equal(l.star_system, star_systems(:two))
  end
end
