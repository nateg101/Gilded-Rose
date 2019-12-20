require 'standard_item'

describe StandardItem do
  subject(:standard_item) { described_class.new('+5 Dexterity Vest', 20, 10) }
  subject(:zero_quality_item) { described_class.new('+5 Dexterity Vest', 1, 0) }
  subject(:negative_sell_in) { described_class.new('+5 Dexterity Vest', -1, 3) }

  context '#quality' do
    it 'knows its quality' do
      expect(standard_item.quality).to eq 10
    end

    it 'adjusts quality' do
      standard_item.update_properties
      expect(standard_item.quality).to eq 9
    end

    it 'does not reduce quality to < 0' do
      zero_quality_item.update_properties
      expect(zero_quality_item.quality).to eq 0
    end

    it 'reduces quality at double the pace after sell by date expired' do
      negative_sell_in.update_properties
      expect(negative_sell_in.quality).to eq 1
    end
  end

  context '#sell_in' do
    it 'knows its sell_in' do
      expect(standard_item.sell_in).to eq 20
    end

    it 'reduces its sell_in by 1' do
      standard_item.update_properties
      expect(standard_item.sell_in).to eq 19
    end
  end
end
