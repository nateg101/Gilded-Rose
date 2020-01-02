class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      next if item.class == LegendaryItem

      item.update_properties
    end
  end
end
