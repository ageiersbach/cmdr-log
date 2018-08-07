require 'test_helper'

class CargoLogTest < ActiveSupport::TestCase
  test "validations" do
    cl = CargoLog.new
    assert !cl.valid?

    cl.commander = commanders(:one)
    cl.commodity = commodities(:one)

    assert cl.valid?
  end
end
