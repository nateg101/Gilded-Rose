class StandardItem < Item

  def update_quality
    return unless @quality.positive?

    @quality -= 1
  end

end
