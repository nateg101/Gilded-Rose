require 'conjured_item'

describe ConjuredItem do
  subject(:conjured_item) { described_class.new('Mana Cake', 3, 6) }
  subject(:one_quality_item) { described_class.new('Mana Cake', 3, 1) }
  subject(:negative_sell_in_item) { described_class.new('Mana Cake', -1, 6) }

  context '#quality' do
    it 'knows its quality' do
      expect(conjured_item.quality).to eq 6
    end

    it 'adjusts quality correctly' do
      conjured_item.update_properties
      expect(conjured_item.quality).to eq 4
    end

    it 'does not reduce quality to < 0' do
      one_quality_item.update_properties
      expect(one_quality_item.quality).to eq 0
    end

    it 'reduces the quality at double pace after sell_in < 0' do
      negative_sell_in_item.update_properties
      expect(negative_sell_in_item.quality).to eq 2
    end
  end

  context '#sell_in' do
    it 'knows its sell_in' do
      expect(conjured_item.sell_in).to eq 3
    end

    it 'reduces its sell_in correctly by 1' do
      conjured_item.update_properties
      expect(conjured_item.sell_in).to eq 2
    end
  end
end
