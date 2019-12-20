class StandardItem < Item

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
    return 1 if @quality == 1 || @sell_in.positive?

    2
  end

end
