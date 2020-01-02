require_relative 'item'

class ConjuredItem < Item

  def update_properties
    update_quality

    @sell_in -= 1
  end

  private

  def update_quality
    return unless @quality.positive?

    @quality -= decrease_quality
  end

  def decrease_quality
    return @quality if @quality < 2 && @sell_in.positive?
    return @quality if @quality < 4 && @sell_in.negative?
    return 2 if @quality == 2 || @sell_in.positive?

    4
  end
end
