require 'test_helper'

class StationTest < ActiveSupport::TestCase
  test "belongs_to System" do
    assert_equal stations(:one).star_system, star_systems(:one)
  end

  test "validations" do
    station = Station.new
    assert !station.valid?
    station.name = "Some Port"
    star_sys = star_systems(:one)
    star_sys.save
    station.star_system = star_sys
    assert station.valid?
  end
end
