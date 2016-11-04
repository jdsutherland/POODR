module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
    def initialize(args)
      @chainring = args.fetch(:chainring, 40)
      @cog       = args.fetch(:cog, 18)
      @wheel     = args[:wheel]
    end

    def gear_inches
      ratio * @wheel.diameter
    end

    def diameter
      @wheel.diameter
    end

    def ratio
      chainring / cog.to_f
    end
  end
end

module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(
      args[:chainring],
      args[:cog],
      args[:wheel])
  end
end

# old
# Gear.new(
#   chainring: 52,
#   cog: 11,
#   wheel: Wheel.new(26, 1.5)).gear_inches

# new
GearWrapper.gear(
  chainring: 52,
  cog: 11,
  wheel: Wheel.new(26, 1.5)).gear_inches
