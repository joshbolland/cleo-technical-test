require 'coin'

describe Coin do
  let(:coin) { described_class.new(50) }

  describe '#initialize' do
    it 'Value is an integer' do
      expect(coin.value).to be_an_instance_of(Integer)
    end

    it 'Default coin quantity of 40' do
      expect(coin.quantity).to eq 40
    end
  end

  describe '#refund' do
    it 'Reduces the quantity of a given coin' do
      expect { coin.refund(2) }.to change { coin.quantity }.from(40).to(38)
    end
  end

  describe '#insert' do
    it 'Increases the quantity of a given coin' do
      expect { coin.insert(2) }.to change { coin.quantity }.from(40).to(42)
    end
  end
end
