require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  test "validations" do
    m = Mission.new
    assert !m.valid?

    m.commander = commanders(:one)
    m.commodity = commodities(:one)
    m.station = stations(:one)

    m.expires_at = Time.now + 3600
    m.target = 1
    m.game_mission_id = 29292

    assert m.valid?
  end
end
