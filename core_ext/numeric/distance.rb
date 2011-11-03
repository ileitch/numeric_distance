class Numeric
  def miles
    Distance.new(self, :miles)
  end
  alias :mile :miles

  def kilometers
    Distance.new(self, :kilometers)
  end
  alias :kilometer :kilometers

  def meters
    Distance.new(self, :meters)
  end
  alias :meter :meters

  def centimeters
    Distance.new(self, :centimeters)
  end
  alias :centimeter :centimeters
end