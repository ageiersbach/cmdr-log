require 'test_helper'

class MissionTargetTest < ActiveSupport::TestCase
  test "validations" do
    mt = MissionTarget.new
    assert !mt.valid?

    mt.cargo_item = cargo_items(:one)
    mt.mission = missions(:one)

    assert mt.valid?
  end
end
