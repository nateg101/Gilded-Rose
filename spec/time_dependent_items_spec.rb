require 'time_dependent_items'

describe TimeDependentItems do
  subject(:backstage_pass) { described_class.new("Backstage passes", 15, 20) }

  context '#quality' do
    it 'knows its quality' do
      expect(backstage_pass.quality).to eq 20
    end
  end
end
