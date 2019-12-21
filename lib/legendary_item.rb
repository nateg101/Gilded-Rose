class LegendaryItem < Item

  QUALITY = 80
  SELL_IN = 0

  def initialize(name, sell_in = SELL_IN, quality = QUALITY)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end
end
