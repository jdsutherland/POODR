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

road_config =
  [['chain',        '10-speed'],
   ['tire_size',    '23'],
   ['tape_color',   'red']]
mountain_config =
  [['chain',        '10-speed'],
   ['tire_size',    '2.1'],
   ['front_shock',  'Manitou', false],
   ['rear_shock',   'Fox']]

