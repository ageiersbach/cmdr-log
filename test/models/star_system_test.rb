require 'test_helper'

class StarSystemTest < ActiveSupport::TestCase
  test "validations" do
    s = StarSystem.new
    assert !s.valid?
    s.name = "Test StarSystem"
    s.x = 0.0
    s.y = -1.22229
    s.z = 130.0000
    assert s.valid?
  end
end
