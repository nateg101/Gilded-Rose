require 'increase_value_item'

describe IncreaseValueItem do

  context 'aged brie type items' do
    subject(:aged_brie) { described_class.new('Aged Brie',2, 0) }

    describe '#quality' do
      it 'knows it own quality' do
        expect(aged_brie.quality).to eq 0
      end

      it 'increases quality correctly' do
        aged_brie.update_properties
        expect(aged_brie.quality).to eq 1
      end
    end
  end

end
