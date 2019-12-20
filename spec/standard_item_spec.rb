require 'standard_item'

describe StandardItem do
  subject(:standard_item) { described_class.new('+5 Dexterity Vest', 20, 10) }

  it 'knows its quality' do
    expect(standard_item.quality).to eq 10
  end

  it 'adjusts quality' do
    standard_item.update_quality
    expect(standard_item.quality).to eq 9
  end
end
