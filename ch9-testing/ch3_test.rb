require 'minitest/autorun'

require_relative 'ch3'

class WheelTest < MiniTest::Unit::TestCase
  def setup
    @wheel = Wheel.new(26, 1.5)
  end

  def test_implements_the_diameterizable_interface
    assert_respond_to(@wheel, :diameter)
  end

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29, wheel.diameter, 0.01)
  end
end

class GearTest < MiniTest::Unit::TestCase
  def setup
    @observer = MiniTest::Mock.new

    @gear = Gear.new(
      chainring: 52,
      cog:       11,
      wheel:     DiameterDouble.new,
      observer:  @observer
    )
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27])
    @gear.set_cog(27)
    @observer.verify
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11])
    @gear.set_chainring(42)
    @observer.verify
  end

  def test_calculates_gear_inches
    gear = Gear.new(
      chainring: 52,
      cog:       11,
      wheel:     DiameterDouble.new
    )

    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end

class DiameterDouble
  def diameter
    10
  end
end

