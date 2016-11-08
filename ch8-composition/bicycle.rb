require_relative 'part'
require_relative 'parts'
require_relative 'parts_factory'

class Bicycle
  attr_reader :size, :parts

  def initialize(args={})
    @size  = args[:size]
    @parts = args[:parts]
  end

  def spares
    parts.spares
  end
end

class RoadBikeParts < Parts
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def default_tire_size
    '23'
  end

  def local_spares
    { tape_color: tape_color }
  end
end

# Initial attempt at MountainBike subclass (it's bad)
class MountainBikeParts < Parts
  attr_reader :front_shock, :rear_shock

  def post_initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
  end

  def default_tire_size
    '2.1'
  end

  def local_spares
    { rear_shock: rear_shock }
  end
end

road_config =
  [['chain',        '10-speed'],
   ['tire_size',    '23'],
   ['tape_color',   'red']]
mountain_config =
  [['chain',        '10-speed'],
   ['tire_size',    '2.1'],
   ['front_shock',  'Manitou', false],
   ['rear_shock',   'Fox']]

