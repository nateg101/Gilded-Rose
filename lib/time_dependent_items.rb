class TimeDependentItems < Item
  def update_properties
    update_quality

    @sell_in -= 1
  end

  private

  def update_quality
    return if quality >= 50

    @quality += increase_quality
  end

  def increase_quality
    return 1 if @quality == 49 || @sell_in.positive?

    2
  end

end
