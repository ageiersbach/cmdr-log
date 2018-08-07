require 'test_helper'

class TargetCommodityTest < ActiveSupport::TestCase
  test "validations" do
    target = TargetCommodity.new
    assert !target.valid?

    target.mission_log_target = mission_log_targets(:one)
    target.commodity = commodities(:one)
    target.count = 1

    assert target.valid?
  end
end
