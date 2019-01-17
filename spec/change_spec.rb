require 'change'

describe Change do
  let(:change) { described_class.new }
  let(:coin) { spy('coin') }

  describe '#initialize' do
    it 'Coins attribute is an array object' do
      change = Change.new
      expect(change.coins).to be_an(Array)
    end

    it 'Coins are instances of the Coin class' do
      change = Change.new
      expect(change.coins[2]).to be_an_instance_of(Coin)
    end
  end
end
