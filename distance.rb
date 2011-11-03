class Distance
  attr_reader :value_in_meters

  CONVERSIONS = { :miles       => 1609.344,
                  :kilometers  => 1000.0,
                  :meters      => 1.0,
                  :centimeters => -100.0 }

  def self.meters_in_unit(meters, unit)
    if CONVERSIONS[unit] < 0
      meters * CONVERSIONS[unit].abs
    else
      meters / CONVERSIONS[unit]
    end
  end

  def self.unit_in_meters(value, unit)
    if CONVERSIONS[unit] < 0
      value / CONVERSIONS[unit].abs
    else
      value * CONVERSIONS[unit]
    end
  end

  def initialize(value, unit)
    @value = value
    @unit = unit
    @value_in_meters = Distance.unit_in_meters(value, unit)
  end

  def inspect
    formatted_value = (@value.to_i == @value ? @value.to_i : @value).to_s
    "%s %s" % [formatted_value, (@value == 1 ? @unit.singularize : @unit)]
  end

  def in_meters
    ::Distance.new(@value_in_meters, :meters)
  end

  def in_kilometers
    ::Distance.new(Distance.meters_in_unit(@value_in_meters, :kilometers), :kilometers)
  end

  def in_miles
    ::Distance.new(Distance.meters_in_unit(@value_in_meters, :miles), :miles)
  end

  def in_centimeters
    ::Distance.new(Distance.meters_in_unit(@value_in_meters, :centimeters), :centimeters)
  end

  def +(other)
    new_value_in_meters = @value_in_meters + other.value_in_meters
    ::Distance.new(Distance.meters_in_unit(new_value_in_meters, @unit), @unit)
  end

  def -(other)
    new_value_in_meters = @value_in_meters - other.value_in_meters
    ::Distance.new(Distance.meters_in_unit(new_value_in_meters, @unit), @unit)
  end

  def <(other)
    @value_in_meters < other.value_in_meters
  end

  def <=(other)
    @value_in_meters <= other.value_in_meters
  end

  def >(other)
    @value_in_meters > other.value_in_meters
  end

  def >=(other)
    @value_in_meters >= other.value_in_meters
  end

  def to_i
    @value.to_i
  end

  def to_f
    @value.to_f
  end
end