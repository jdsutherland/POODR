class Bicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(*args)
    @style = args[:style]
    @size = args[:size]
    @tape_color = args[:tape_color]
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
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

  def spares
    super.merge(rear_shock: rear_shock)
  end
end

mountain_bike = MountainBike.new( size: 'S',
                                 front_shock:  'Manitou',
                                 rear_shock:   'Fox')
mountain_bike.size # -> 'S'
mountain_bike.spares
# -> {:tire_size   => "23",       <- wrong!
#     :chain       => "10-speed",
#     :tape_color  => nil,        <- not applicable
#     :front_shock => 'Manitou',
#     :rear_shock  => "Fox"}
