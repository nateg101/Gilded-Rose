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
    if @quality < 2 && @sell_in.positive?
      return @quality
    elsif @quality < 4 && @sell_in.negative?
      return @quality
    elsif @quality == 2 || @sell_in.positive?
      return 2
    else
      4
    end
  end
end
