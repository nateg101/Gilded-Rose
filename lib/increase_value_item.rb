
class IncreaseValueItem < Item

  def update_properties
    update_quality

    @sell_in -= 1
  end

  def update_quality

    @quality += increase_quality
  end

  def increase_quality
    return 1 if @quality == 1 || @sell_in.positive?

    2
  end

end
