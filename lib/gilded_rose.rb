class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update_properties
    end
  end
end
