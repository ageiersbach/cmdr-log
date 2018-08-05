require 'test_helper'

class MissionLogTargetTest < ActiveSupport::TestCase
  test "validations" do
    mlt = MissionLogTarget.new
    assert !mlt.valid?

    mlt.mission_log = mission_logs(:one)
    mlt.station = stations(:one)

    assert mlt.valid?
  end
end
