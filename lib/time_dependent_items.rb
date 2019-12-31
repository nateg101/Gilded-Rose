class TimeDependentItems < Item
  def update_properties
    update_quality

    @sell_in -= 1
  end

  private

  def update_quality
    return @quality = 0 unless sell_in > 0
    return if @quality >= 50

    @quality += increase_quality
  end

  def increase_quality
    return 1 if @quality == 49 || @sell_in > 10
    return 2 if @quality == 48 || @sell_in > 5

    3
  end

end
