class Bicycle
  attr_reader :size, :chain, :tire_size

  def initalize(*args)
    @size      = args[:size]
    @chain     = args[:chain]     || default_chain
    @tire_size = args[:tire_size] || default_tire_size
  end

  def default_chain
    '10-speed'
  end
end

class RoadBike < Bicycle
  attr_reader :style, :tape_color, :front_shock, :rear_shock

  def initialize(*args)
    @style = args[:style]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def default_tire_size
    '23'
  end

  # checking style starts down a slippery slope
  def spares
    if style == :road
      {
        chain:      '10 speed',
        tire_size:  '23', # millimeters
        tape_color: tape_color
      }
    else
      {
        chain:      '10 speed',
        tire_size:  '2.1', # inches
        rear_shock: rear_shock
      }
    end
  end
end

# Initial attempt at MountainBike subclass (it's bad)
class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(*args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def default_tire_size
    '2.1'
  end

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

road_bike = RoadBike.new(
  size:       'M',
  tape_color: 'red'
)

road_bike.tire_size     # => '23'
road_bike.chain         # => "10-speed"
mountain_bike = MountainBike.new(
  size:        'S',
  front_shock: 'Manitou',
  rear_shock:  'Fox'
)
mountain_bike.tire_size # => '2.1'
road_bike.chain         # => "10-speed"
