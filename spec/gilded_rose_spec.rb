require 'gilded_rose'
require 'item'

describe GildedRose do

  ConjuredItemDouble = Class.new
  IncreaseValueItemDouble = Class.new
  TimeDependentItemsDouble = Class.new
  LegendaryItemDouble = Class.new
  StandardItemDouble = Class.new

  let(:conjured_item) do
    double(:conjured_item, update_properties: nil, class: ConjuredItemDouble)
  end

  let(:increase_value_item) do
    double(:increase_value_item, update_properties: nil, class: IncreaseValueItemDouble)
  end

  let (:time_dependent_item) do
    double(:time_dependent_item, update_properties: nil, class: TimeDependentItemsDouble)
  end

  let (:standard_item) do
    double(:standard_item, update_properties: nil, class: StandardItemDouble)
  end

  let (:legendary_item) do
    double(:legendary_item, update_properties: nil, class: LegendaryItemDouble)
  end

  subject(:gilded_rose) do
    items = [conjured_item, increase_value_item, time_dependent_item, standard_item, legendary_item]
    described_class.new(items)
  end


  context "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it 'calls update_properties on conjured_item' do
      expect(conjured_item).to receive (:update_properties)
      gilded_rose.update_quality
    end

    it 'calls update_properties on increase_value_item' do
      expect(increase_value_item).to receive (:update_properties)
      gilded_rose.update_quality
    end

    it 'calls update_properties on time_dependent_item' do
      expect(time_dependent_item).to receive (:update_properties)
      gilded_rose.update_quality
    end

    it 'calls update_properties on standard_item' do
      expect(standard_item).to receive (:update_properties)
      gilded_rose.update_quality
    end
  end
end
