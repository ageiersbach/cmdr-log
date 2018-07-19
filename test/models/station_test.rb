require 'test_helper'

class StationTest < ActiveSupport::TestCase
  test "belongs_to System" do
    assert_equal stations(:one).system, systems(:one)
  end

  test "validations" do
    station = Station.new
    assert !station.valid?
    system = systems(:one).save
    station.name = "Some Port"
    station.system = system
    assert !station.valid?
    puts station.errors.full_messages
  end
end
