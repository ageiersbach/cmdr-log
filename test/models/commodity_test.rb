require 'test_helper'

class CommodityTest < ActiveSupport::TestCase
  test "validations" do
    c = Commodity.new
    assert !c.valid?
    c.name = "Wine"
    assert c.valid?
  end
end
