require 'test_helper'

class MissionLogTest < ActiveSupport::TestCase
  test "validations" do
    ml = MissionLog.new

    assert !ml.valid?

    ml.commander = commanders(:one)

    assert ml.valid?
  end
end
