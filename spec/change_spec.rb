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

  describe '#refund_coin' do
    it 'Coin release method functions properly' do
      test_change = make_mock_coins(coin)
      test_change.refund_coin(1, 1)
      expect(coin).to have_received(:refund).with(1)
    end
  end

  describe '#insert_coin' do
    it 'Coin insert method functions properly' do
      test_change = make_mock_coins(coin)
      test_change.insert_coin(1, 4)
      expect(coin).to have_received(:insert).with(4)
    end
  end

  describe '#return_change' do
    it 'Returns 40p change' do
      expect(change.return_change([100, 50], 90)).to eq [50, 10]
    end
  end
end
