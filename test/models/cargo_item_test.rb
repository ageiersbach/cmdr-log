require 'test_helper'

class CargoItemTest < ActiveSupport::TestCase
  test "validations" do
    c = CargoItem.new
    assert !c.valid?
    c.commander = commanders(:one)
    c.commodity = commodities(:one)
    assert c.valid?
  end
end
