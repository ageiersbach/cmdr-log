require 'test_helper'

class MissionLogTest < ActiveSupport::TestCase
  test "validations" do
    ml = MissionLog.new

    assert !ml.valid?

    ml.commander = commanders(:one)

    assert ml.valid?
  end

  test "dependent destroy" do
    target_commodity = target_commodities(:one)
    target_commodity.save!
    log_target = target_commodity.mission_log_target
    log = log_target.mission_log

    log.destroy

    assert log.destroyed?
    assert log_target.destroyed?
    assert target_commodity.destroyed?
  end
end
