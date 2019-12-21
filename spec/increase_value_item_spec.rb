require 'increase_value_item'

describe IncreaseValueItem do

  context 'aged brie type items' do
    subject(:aged_brie) { described_class.new('Aged Brie',2, 0) }
    subject(:negative_sell_in_item) { described_class.new('Aged Brie',-1, 4) }
    subject(:high_quality_brie) { described_class.new('Aged Brie',2, 50) }

    describe '#quality' do
      it 'knows it own quality' do
        expect(aged_brie.quality).to eq 0
      end

      it 'increases quality correctly' do
        aged_brie.update_properties
        expect(aged_brie.quality).to eq 1
      end

      it 'does not increase quality when quality = 50' do
        high_quality_brie.update_properties
        expect(high_quality_brie.quality).to eq 50
      end

      it 'increases quality at double the rate when sell_in negative' do
        negative_sell_in_item.update_properties
        expect(negative_sell_in_item.quality).to eq 6
      end
    end

    describe '#sell_in' do
      it 'knows its sell_in' do
        expect(aged_brie.sell_in).to eq 2
      end
    end
  end

end
