require 'minitest/autorun'

require_relative 'ch5'
require_relative 'preparer_interface_test'

class MechanicTest < MiniTest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end
end

class TripCoordinatorTest < MiniTest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < MiniTest::Unit::TestCase
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end
