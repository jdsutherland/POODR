class PartsFactory
  def self.build(config, part_class = Part, parts_class = Parts)
    parts_class.new(
      config.map do |part_config|
        part_class.new(
          name:        part_config[0],
          description: part_config[1],
          needs_spare: part_config.fetch(2, true))
      end
    )
  end
end
