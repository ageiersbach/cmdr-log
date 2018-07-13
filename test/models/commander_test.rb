require 'test_helper'

class CommanderTest < ActiveSupport::TestCase
  test "validations" do
    c = Commander.new
    assert !c.valid?
    assert c.errors[:email].include?("can't be blank")
    c.email = "f@example.com"
    assert c.valid?
  end
end
