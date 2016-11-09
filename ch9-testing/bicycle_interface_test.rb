require 'ch6'

module BicycleInterfaceTest
  def test_responds_to_default_chain
    assert_responds_to(@object, :default_chain)
  end

  def test_responds_to_default_tire_size
    assert_responds_to(@object, :default_tire_size)
  end

  def test_responds_to_spares
    assert_responds_to(@object, :spares)
  end

  def test_responds_to_chain
    assert_responds_to(@object, :chain)
  end

  def test_responds_to_tire_size
    assert_responds_to(@object, :tire_size)
  end
end
