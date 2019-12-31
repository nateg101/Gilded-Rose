require 'time_dependent_items'

describe TimeDependentItems do
  subject(:backstage_pass) { described_class.new("Backstage passes", 15, 20) }
  subject(:backstage_pass_9days) { described_class.new("Backstage passes", 9, 20) }
  subject(:backstage_pass_4days) { described_class.new("Backstage passes", 4, 20) }
  subject(:backstage_pass_0days) { described_class.new("Backstage passes", 0, 20) }

  context '#quality' do
    it 'knows its quality' do
      expect(backstage_pass.quality).to eq 20
    end

    it 'increases in quality by 1 when sell_in > 10' do
      backstage_pass.update_properties
      expect(backstage_pass.quality).to eq 21
    end

    it 'increases in quality by 2 when sell_in >5 && < 10' do
      backstage_pass_9days.update_properties
      expect(backstage_pass_9days.quality).to eq 22
    end

    it 'increases in quality by 3 when sell_in <5' do
      backstage_pass_4days.update_properties
      expect(backstage_pass_4days.quality).to eq 23
    end

    it 'has quality = 0 when sell_in < 0' do
      backstage_pass_0days.update_properties
      expect(backstage_pass_0days.quality).to eq 0
    end
  end
end
