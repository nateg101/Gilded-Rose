require 'legendary_item'

describe LegendaryItem do
  subject(:legendary_item) { described_class.new("Sulfuras", 0, 80) }

  context '#quality' do
    it 'knows its quality' do
      expect(legendary_item.quality).to eq 80
    end
  end
end
