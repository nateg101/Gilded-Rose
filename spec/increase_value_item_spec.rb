require 'increase_value_item'

describe IncreaseValueItem do
  subject(:increase_value_item) { described_class.new('Aged Brie',2, 0) }

  context '#quality' do
    it 'knows it own quality' do
      expect(increase_value_item.quality).to eq 0
    end
  end
end
