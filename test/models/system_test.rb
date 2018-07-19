require 'test_helper'

class SystemTest < ActiveSupport::TestCase
  test "validations" do
    s = System.new
    assert !s.valid?
    s.name = "Test System"
    s.x = 0.0
    s.y = -1.22229
    s.z = 130.0000
    assert s.valid?
  end
end
