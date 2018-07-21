require 'test_helper'

class CommanderTest < ActiveSupport::TestCase
  test "fixture" do
    c = commanders(:one)
    assert_equal(c.name, "miner")
    assert c.valid?
  end

  test "validations" do
    c = Commander.new
    assert !c.valid?
    assert c.errors[:email].include?("can't be blank")
    assert c.errors[:password].include?("can't be blank")
    c.location = star_systems(:one)
    c.email = "f@example.com"
    c.password = "123123123"
    c.password_confirmation = "123123123"
    assert c.valid?
  end

  test "star_system" do
    c = commanders(:one)
    assert_equal(c.star_system, star_systems(:one))

    c.location = stations(:two)

    assert_equal(c.star_system, star_systems(:two))
  end
end
